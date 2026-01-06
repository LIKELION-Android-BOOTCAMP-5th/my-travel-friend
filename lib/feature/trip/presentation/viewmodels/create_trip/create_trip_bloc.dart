import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/domain/repositories/trip_repository.dart';
import 'package:my_travel_friend/feature/trip/domain/usecases/create_trip_request_usecase.dart';

import '../../../domain/usecases/create_trip_usecase.dart';
import '../../../domain/usecases/get_user_by_id_usecase.dart';
import 'create_trip_event.dart';
import 'create_trip_state.dart';

@injectable
class CreateTripBloc extends Bloc<CreateTripEvent, CreateTripState> {
  final CreateTripUsecase _createTripUsecase;
  final TripRepository _tripRepository;
  final GetUserByIdUseCase _getUserByIdUseCase;
  final CreateTripRequestUsecase _createTripRequestUsecase;
  Timer? _debounce;

  final generativeModel = FirebaseAI.googleAI().generativeModel(
    model: "gemini-2.5-flash",
  );

  CreateTripBloc(
    this._createTripUsecase,
    this._tripRepository,
    this._getUserByIdUseCase,
    this._createTripRequestUsecase,
  ) : super(const CreateTripState()) {
    on<ChangeTitle>(_onChangeTitle);
    on<ChangePlace>(_onChangePlaceWithDebounce);
    on<PlaceAIResult>(_onPlaceAIResult);
    on<ChangeStartAt>(_onChangeStartAt);
    on<ChangeEndAt>(_onChangeEndAt);
    on<DismissSameDayDialog>(_onDismissSameDayDialog);
    on<ValidateDate>(_onValidateDate);
    on<SameDayDetected>(_onSameDayDetected);
    on<ChangeCoverStyle>(_onChangeCoverStyle);
    on<ChangeCoverColor>(_onChangeCoverColor);
    on<SelectCoverImg>(_onSelectCoverImg);
    on<RemoveCoverImg>(_onRemoveCoverImg);
    on<SetFriend>(_onSetFriend);
    on<CreateTrip>(_onCreateTrip);
    on<Reset>(_onReset);
    on<Initialized>(_onInitialized);
  }

  // 여행 제목 변경
  void _onChangeTitle(ChangeTitle event, Emitter<CreateTripState> emit) {
    emit(state.copyWith(title: event.title));
  }

  // 장소 변경 + Debounce + Gemini API 자동 호출
  void _onChangePlaceWithDebounce(
    ChangePlace event,
    Emitter<CreateTripState> emit,
  ) {
    emit(state.copyWith(place: event.place));

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    if (event.place.isEmpty) return;

    _debounce = Timer(const Duration(milliseconds: 600), () async {
      try {
        final prompt =
            """
"${event.place}"는 어느 나라에 있어?
국가 이름만 한 단어로만 말해줘.
""";
        final response = await generativeModel.generateContent([
          Content.text(prompt),
        ]);

        final resultText = response.text?.trim() ?? "Unknown";

        add(
          CreateTripEvent.placeAIResult(
            country: resultText.isEmpty ? "Unknown" : resultText,
          ),
        );
      } catch (_) {}
    });
  }

  void _onPlaceAIResult(PlaceAIResult event, Emitter<CreateTripState> emit) {
    emit(state.copyWith(country: event.country));
  }

  void _onChangeStartAt(ChangeStartAt event, Emitter<CreateTripState> emit) {
    emit(state.copyWith(startAt: event.startAt));
    add(const ValidateDate());
  }

  void _onChangeEndAt(ChangeEndAt event, Emitter<CreateTripState> emit) {
    emit(state.copyWith(endAt: event.endAt));
    add(const ValidateDate());
  }

  void _onValidateDate(ValidateDate event, Emitter<CreateTripState> emit) {
    if (state.startAt.isNotEmpty &&
        state.endAt.isNotEmpty &&
        state.startAt == state.endAt) {
      emit(state.copyWith(showSameDayDialog: true));
    } else {
      emit(state.copyWith(showSameDayDialog: false));
    }
  }

  void _onDismissSameDayDialog(
    DismissSameDayDialog event,
    Emitter<CreateTripState> emit,
  ) {
    emit(state.copyWith(showSameDayDialog: false));
  }

  void _onSameDayDetected(
    SameDayDetected event,
    Emitter<CreateTripState> emit,
  ) {
    emit(state.copyWith(isSameDay: true, showSameDayDialog: false));
  }

  void _onChangeCoverStyle(
    ChangeCoverStyle event,
    Emitter<CreateTripState> emit,
  ) {
    emit(state.copyWith(coverStyle: event.style));
  }

  void _onChangeCoverColor(
    ChangeCoverColor event,
    Emitter<CreateTripState> emit,
  ) {
    emit(
      state.copyWith(
        coverStyle: "COLOR",
        coverType: event.color,
        coverImg: null,
        localImgFile: null,
      ),
    );
  }

  void _onSelectCoverImg(
    SelectCoverImg event,
    Emitter<CreateTripState> emit,
  ) async {
    emit(
      state.copyWith(
        coverStyle: "IMAGE",
        coverType: "IMAGE",
        localImgFile: event.file,
        coverImg: null,
      ),
    );
  }

  void _onRemoveCoverImg(RemoveCoverImg event, Emitter<CreateTripState> emit) {
    emit(state.copyWith(localImgFile: null, coverImg: null));
  }

  Future<void> _onInitialized(
    Initialized event,
    Emitter<CreateTripState> emit,
  ) async {
    emit(
      state.copyWith(
        userId: event.userId,
        friendId: event.friendId,
        coverStyle: "COLOR",
        coverType: "BLUE",
        coverImg: null,
        localImgFile: null,
      ),
    );
    if (event.friendId != null) {
      final result = await _getUserByIdUseCase(event.friendId!);

      result.when(
        success: (user) {
          emit(state.copyWith(friendUser: user));
        },
        failure: (f) {},
      );
    }
  }

  void _onSetFriend(SetFriend event, Emitter<CreateTripState> emit) {
    emit(state.copyWith(friendId: event.friendId));
  }

  Future<void> _onCreateTrip(
    CreateTrip event,
    Emitter<CreateTripState> emit,
  ) async {
    emit(
      state.copyWith(
        pageState: CreateTripPageState.loading,
        message: null,
        errorType: null,
      ),
    );

    String? coverImageUrl = state.coverImg;

    try {
      if (state.coverStyle == "IMAGE" && state.localImgFile != null) {
        emit(state.copyWith(isUploading: true));

        final uploadResult = await _tripRepository.uploadImg(
          file: state.localImgFile!,
        );

        uploadResult.when(
          success: (url) {
            coverImageUrl = url;
          },
          failure: (e) {
            emit(
              state.copyWith(
                pageState: CreateTripPageState.error,
                isUploading: false,
                message: e.message ?? "커버 이미지 업로드에 실패했어요!",
                errorType: "upload_error",
              ),
            );
            return;
          },
        );
      }

      final result = await _createTripUsecase(
        state.toEntity().copyWith(coverImg: coverImageUrl),
      );

      result.when(
        success: (trip) async {
          String finalMessage = "새로운 여행 일정이 만들어졌어요!";
          emit(
            state.copyWith(
              createTrip: trip,
              isUploading: false,
              pageState: CreateTripPageState.success,
              message: finalMessage,
            ),
          );

          if (state.friendId != null) {
            final inviteResult = await _createTripRequestUsecase(
              state.userId,
              state.friendId!,
              trip.id!,
            );

            inviteResult.when(
              success: (_) {
                finalMessage = '여행이 생성되고 친구를 초대했어요!';
              },
              failure: (_) {
                finalMessage = '여행은 생성됐지만 초대에 실패했어요';
              },
            );
          }
        },

        failure: (e) {
          emit(
            state.copyWith(
              pageState: CreateTripPageState.error,
              isUploading: false,
              message: e.message ?? "여행 생성에 실패했어요!",
              errorType: 'create_trip_error',
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          pageState: CreateTripPageState.error,
          isUploading: false,
          message: "알 수 없는 오류가 발생했어요!",
          errorType: 'unknown',
        ),
      );
    }
  }

  void _onReset(Reset event, Emitter<CreateTripState> emit) {
    emit(const CreateTripState());
  }
}
