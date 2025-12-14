import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/chat_entity.dart';
import '../../domain/usecases/get_chat_usecase.dart';
import '../../domain/usecases/get_read_status_usecase.dart';
import '../../domain/usecases/get_trip_crew_usecase.dart';
import '../../domain/usecases/send_chat_usecase.dart';
import '../../domain/usecases/subscribe_chat_usecase.dart';
import '../../domain/usecases/update_read_status_usecase.dart';
import 'chat_event.dart';
import 'chat_state.dart';

// [이재은] 채팅 Bloc

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatUseCase _getChatUseCase;
  final SendChatUseCase _sendChatUseCase;
  final SubscribeChatUseCase _subscribeChatUseCase;
  final GetReadStatusUseCase _getReadStatusUseCase;
  final UpdateReadStatusUseCase _updateReadStatusUseCase;
  final GetTripCrewUseCase _getTripCrewUseCase;

  StreamSubscription? _chatSubscription;
  Timer? _readStatusDebounce;
  static const int _pageLimit = 30;

  ChatBloc(
    this._getChatUseCase,
    this._sendChatUseCase,
    this._subscribeChatUseCase,
    this._getReadStatusUseCase,
    this._updateReadStatusUseCase,
    this._getTripCrewUseCase,
  ) : super(const ChatState()) {
    on<EnterChat>(_onEnterChat);
    on<LeaveChat>(_onLeaveChat);
    on<SendChat>(_onSendChat);
    on<LoadMore>(_onLoadMore);
    on<OnNewChatReceive>(_onNewChatReceive);
    on<UpdateReadStatus>(_onUpdateReadStatus);
    on<ClearError>(_onClearError);
    on<MarkScrollCompleted>(_onMarkScrollCompleted);
  }

  // 채팅방 입장
  Future<void> _onEnterChat(EnterChat event, Emitter<ChatState> emit) async {
    emit(
      state.copyWith(
        tripId: event.tripId,
        userId: event.userId,
        pageState: ChatPageState.loading,
      ),
    );

    // 여행 크루 정보 가져오기
    final crewsRes = await _getTripCrewUseCase(tripId: event.tripId);
    crewsRes.when(
      success: (crews) {
        emit(state.copyWith(crews: crews));
      },
      failure: (_) {},
    );

    // 마지막 읽은 위치 조회
    int? lastReadChatId;
    final readStatusRes = await _getReadStatusUseCase(
      tripId: event.tripId,
      userId: event.userId,
    );

    readStatusRes.when(
      success: (status) {
        lastReadChatId = status?.lastReadChatId;
      },
      failure: (_) {},
    );

    // 메시지 가져오기 (최신 메시지부터)
    final chatRes = await _getChatUseCase(
      tripId: event.tripId,
      page: 0,
      limit: _pageLimit,
    );

    chatRes.when(
      success: (chats) {
        // 안 읽은 메시지 개수 계산
        int unreadCount = 0;
        int? scrollToChatId;

        if (lastReadChatId != null && chats.isNotEmpty) {
          unreadCount = chats
              .where((c) => (c.id ?? 0) > lastReadChatId!)
              .length;
          // 마지막 읽은 위치(스크롤할 곳) ID 설정
          scrollToChatId = lastReadChatId;
        }

        emit(
          state.copyWith(
            pageState: ChatPageState.loaded,
            chats: chats,
            lastReadChatId: lastReadChatId,
            unreadCount: unreadCount,
            scrollToChatId: scrollToChatId,
            currentPage: 0,
            hasMore: chats.length >= _pageLimit,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: ChatPageState.error,
            errorMessage: failure.message,
          ),
        );
      },
    );

    // 실시간 구독 시작
    _chatSubscription?.cancel();
    _chatSubscription = _subscribeChatUseCase(tripId: event.tripId).listen((
      result,
    ) {
      result.when(
        success: (chats) {
          add(OnNewChatReceive(chats: chats));
        },
        failure: (_) {},
      );
    });
  }

  // 채팅 나가면
  Future<void> _onLeaveChat(LeaveChat event, Emitter<ChatState> emit) async {
    // 마지막으로 본 메시지 ID 저장
    if (state.chats.isNotEmpty) {
      final lastChatId = state.chats.last.id;
      if (lastChatId != null) {
        await _updateReadStatusUseCase(
          tripId: state.tripId,
          userId: state.userId,
          lastReadChatId: lastChatId,
        );
      }
    }

    // 정리
    _readStatusDebounce?.cancel();
    _chatSubscription?.cancel();
    _chatSubscription = null;
    await _subscribeChatUseCase.unsubscribe();
    emit(const ChatState());
  }

  // 메시지 전송
  Future<void> _onSendChat(SendChat event, Emitter<ChatState> emit) async {
    if (event.message.trim().isEmpty) return;
    if (state.isSending) return;

    emit(state.copyWith(isSending: true));

    final chat = ChatEntity(
      tripId: state.tripId,
      userId: state.userId,
      message: event.message.trim(),
    );

    final res = await _sendChatUseCase(chat: chat);

    res.when(
      success: (sentChat) {
        // 전송 성공 시 읽음 상태도 업데이트
        if (sentChat.id != null) {
          add(UpdateReadStatus(lastReadChatId: sentChat.id!));
        }
        emit(state.copyWith(isSending: false));
      },
      failure: (failure) {
        emit(state.copyWith(isSending: false, errorMessage: failure.message));
      },
    );
  }

  // 이전 메시지 더 불러오기 (위로 스크롤)
  Future<void> _onLoadMore(LoadMore event, Emitter<ChatState> emit) async {
    if (state.pageState != ChatPageState.loaded) return;
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;

    final res = await _getChatUseCase(
      tripId: state.tripId,
      page: nextPage,
      limit: _pageLimit,
    );

    res.when(
      success: (olderChats) {
        // 이전 메시지를 앞에 추가
        final List<ChatEntity> updatedChats = [];
        updatedChats.addAll(olderChats);
        updatedChats.addAll(state.chats);

        emit(
          state.copyWith(
            chats: updatedChats,
            currentPage: nextPage,
            hasMore: olderChats.length >= _pageLimit,
            isLoadingMore: false,
          ),
        );
      },
      failure: (_) {
        emit(state.copyWith(isLoadingMore: false));
      },
    );
  }

  // 새 메시지 수신 (실시간)
  void _onNewChatReceive(OnNewChatReceive event, Emitter<ChatState> emit) {
    final newChats = event.chats.cast<ChatEntity>();

    // 안 읽은 메시지 개수 업데이트
    int unreadCount = 0;
    if (state.lastReadChatId != null) {
      unreadCount = newChats
          .where((c) => (c.id ?? 0) > state.lastReadChatId!)
          .length;
    }

    emit(state.copyWith(chats: newChats, unreadCount: unreadCount));
  }

  // 읽음 상태 업데이트 (디바운스 적용)
  Future<void> _onUpdateReadStatus(
    UpdateReadStatus event,
    Emitter<ChatState> emit,
  ) async {
    // 이미 읽은 메시지면 무시
    if (state.lastReadChatId != null &&
        event.lastReadChatId <= state.lastReadChatId!) {
      return;
    }

    // 디바운스: 500ms 후 서버 업데이트
    _readStatusDebounce?.cancel();
    _readStatusDebounce = Timer(const Duration(milliseconds: 500), () async {
      await _updateReadStatusUseCase(
        tripId: state.tripId,
        userId: state.userId,
        lastReadChatId: event.lastReadChatId,
      );
    });

    // UI는 즉시 업데이트
    final unreadCount = state.chats
        .where((c) => (c.id ?? 0) > event.lastReadChatId)
        .length;

    emit(
      state.copyWith(
        lastReadChatId: event.lastReadChatId,
        unreadCount: unreadCount,
        scrollToChatId: null, // 스크롤 완료 후 초기화
      ),
    );
  }

  // 에러 메시지 초기화
  void _onClearError(ClearError event, Emitter<ChatState> emit) {
    emit(state.copyWith(errorMessage: null));
  }

  @override
  Future<void> close() {
    _readStatusDebounce?.cancel();
    _chatSubscription?.cancel();
    _subscribeChatUseCase.unsubscribe();
    return super.close();
  }

  void _onMarkScrollCompleted(
    MarkScrollCompleted event,
    Emitter<ChatState> emit,
  ) {
    emit(state.copyWith(hasScrolledToLastRead: true, scrollToChatId: null));
  }
}
