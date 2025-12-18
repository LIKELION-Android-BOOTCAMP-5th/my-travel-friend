import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/result/result.dart';
import '../../../domain/usecases/get_unread_count_usecase.dart';
import '../../../domain/usecases/subscribe_chat_usecase.dart';
import 'chat_unread_event.dart';
import 'chat_unread_state.dart';

// [이재은] 채팅 안 읽은 개수 Bloc (하단 네비게이션 배지용)

@injectable
class ChatUnreadBloc extends Bloc<ChatUnreadEvent, ChatUnreadState> {
  final GetUnreadCountUseCase _getUnreadCountUseCase;
  final SubscribeChatUseCase _subscribeChatUseCase;

  StreamSubscription? _chatSubscription;

  ChatUnreadBloc(this._getUnreadCountUseCase, this._subscribeChatUseCase)
    : super(const ChatUnreadState()) {
    on<StartUnreadSubscription>(_onStartSubscription);
    on<StopUnreadSubscription>(_onStopSubscription);
    on<OnNewUnreadMessage>(_onNewMessage);
    on<ResetUnreadCount>(_onResetCount);
    on<RefreshUnreadCount>(_onRefreshCount);
  }

  // 구독 시작
  Future<void> _onStartSubscription(
    StartUnreadSubscription event,
    Emitter<ChatUnreadState> emit,
  ) async {
    // 이미 같은 tripId로 구독 중이면 무시
    if (state.isSubscribed && state.tripId == event.tripId) return;

    // 기존 구독 해제
    await _chatSubscription?.cancel();

    emit(
      state.copyWith(
        tripId: event.tripId,
        userId: event.userId,
        isSubscribed: true,
      ),
    );

    // 초기 안 읽은 개수 로드
    await _loadUnreadCount(emit);

    // 실시간 구독 시작
    _chatSubscription = _subscribeChatUseCase(tripId: event.tripId).listen((_) {
      // 새 메시지가 오면 카운트 새로고침
      add(const OnNewUnreadMessage());
    });
  }

  // 구독 해제
  Future<void> _onStopSubscription(
    StopUnreadSubscription event,
    Emitter<ChatUnreadState> emit,
  ) async {
    await _chatSubscription?.cancel();
    _chatSubscription = null;
    await _subscribeChatUseCase.unsubscribe();

    emit(const ChatUnreadState());
  }

  // 새 메시지 수신 시
  Future<void> _onNewMessage(
    OnNewUnreadMessage event,
    Emitter<ChatUnreadState> emit,
  ) async {
    await _loadUnreadCount(emit);
  }

  // 채팅방 진입 시 카운트 초기화
  void _onResetCount(ResetUnreadCount event, Emitter<ChatUnreadState> emit) {
    emit(state.copyWith(unreadCount: 0));
  }

  // 채팅방 나올 때 카운트 새로고침
  Future<void> _onRefreshCount(
    RefreshUnreadCount event,
    Emitter<ChatUnreadState> emit,
  ) async {
    await _loadUnreadCount(emit);
  }

  // 안 읽은 개수 로드
  Future<void> _loadUnreadCount(Emitter<ChatUnreadState> emit) async {
    if (state.tripId == 0 || state.userId == 0) return;

    final result = await _getUnreadCountUseCase(
      tripId: state.tripId,
      userId: state.userId,
    );

    result.when(
      success: (count) {
        emit(state.copyWith(unreadCount: count));
      },
      failure: (_) {},
    );
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    _subscribeChatUseCase.unsubscribe();
    return super.close();
  }
}
