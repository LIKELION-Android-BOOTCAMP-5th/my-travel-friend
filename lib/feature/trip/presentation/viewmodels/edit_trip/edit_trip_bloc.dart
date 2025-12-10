import 'dart:async';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/domain/repositories/trip_repository.dart';
import 'package:my_travel_friend/feature/trip/domain/usecases/edit_trip_usecase.dart';

import 'edit_trip_event.dart';
import 'edit_trip_state.dart';

@injectable
class EditTripBloc extends Bloc<EditTripEvent, EditTripState> {
  final EditTripUsecase _editTripUsecase;
  final TripRepository _tripRepository;

  Timer? _debounce;

  final generativeModel = FirebaseAI.googleAI().generativeModel(
    model: "gemini-2.5-flash",
  );

  EditTripBloc(this._editTripUsecase, this._tripRepository)
    : super(const EditTripState()) {
    on<LoadTrip>(_onLoadTrip);
    on<ChangeTitle>(_onChangeTitle);
    on<ChangePlace>(_onChangePlace);
    on<PlaceAIResult>(_onPlaceAIResult);
    on<ChangeStartAt>(_onChangeStartAt);
    on<ChangeEndAt>(_onChangeEndAt);

    on<ValidateDate>(_onValidateDate);
    on<SameDayDetected>(_onSameDayDetected);
    on<DismissSameDayDialog>(_onDismissSameDayDialog);

    on<ChangeCoverStyle>(_onChangeCoverStyle);
    on<ChangeCoverColor>(_onChangeCoverColor);
    on<SelectCoverImg>(_onSelectCoverImg);
    on<RemoveCoverImg>(_onRemoveCoverImg);

    on<SaveTrip>(_onSaveTrip);
    on<CancelEdit>(_onCancelEdit);
    on<Reset>(_onReset);
  }

  // 🔹 원본 Trip 불러오기
  void _onLoadTrip(LoadTrip event, Emitter<EditTripState> emit) {
    final trip = event.trip;

    final cleanStart = trip.startAt.contains("T")
        ? trip.startAt.split("T").first
        : trip.startAt;
    final cleanEnd = trip.endAt.contains("T")
        ? trip.endAt.split("T").first
        : trip.endAt;

    emit(
      state.copyWith(
        tripId: trip.id,
        originalTrip: trip,
        title: trip.title,
        place: trip.place,
        startAt: cleanStart,
        endAt: cleanEnd,
        coverType: trip.coverType,
        coverImg: trip.coverImg,
        country: trip.country,
        userId: trip.userId,
        coverStyle: trip.coverImg != null && trip.coverImg!.isNotEmpty
            ? "IMAGE"
            : "COLOR",
        pageState: EditTripPageState.loaded,
      ),
    );
  }

  void _onChangeTitle(ChangeTitle e, Emitter<EditTripState> emit) {
    emit(state.copyWith(title: e.title));
  }

  // 장소 변경 + Debounce + Gemini API 자동 호출
  void _onChangePlace(ChangePlace event, Emitter<EditTripState> emit) {
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
          EditTripEvent.placeAIResult(
            country: resultText.isEmpty ? "Unknown" : resultText,
          ),
        );
      } catch (_) {
        // Gemini 오류는 조용히 무시
      }
    });
  }

  void _onPlaceAIResult(PlaceAIResult event, Emitter<EditTripState> emit) {
    emit(state.copyWith(country: event.country));
  }

  void _onChangeStartAt(ChangeStartAt e, Emitter<EditTripState> emit) {
    emit(state.copyWith(startAt: e.startAt));
    add(const ValidateDate());
  }

  void _onChangeEndAt(ChangeEndAt e, Emitter<EditTripState> emit) {
    emit(state.copyWith(endAt: e.endAt));
    add(const ValidateDate());
  }

  void _onValidateDate(ValidateDate e, Emitter<EditTripState> emit) {
    final same =
        state.startAt.isNotEmpty &&
        state.endAt.isNotEmpty &&
        state.startAt == state.endAt;
    emit(state.copyWith(showSameDayDialog: same));
  }

  void _onSameDayDetected(SameDayDetected e, Emitter<EditTripState> emit) {
    emit(state.copyWith(isSameDay: true, showSameDayDialog: false));
  }

  void _onDismissSameDayDialog(
    DismissSameDayDialog e,
    Emitter<EditTripState> emit,
  ) {
    emit(state.copyWith(showSameDayDialog: false));
  }

  void _onChangeCoverStyle(ChangeCoverStyle e, Emitter<EditTripState> emit) {
    emit(state.copyWith(coverStyle: e.style));
  }

  void _onChangeCoverColor(ChangeCoverColor e, Emitter<EditTripState> emit) {
    emit(
      state.copyWith(
        coverType: e.color,
        coverStyle: "COLOR",
        localImgFile: null,
        coverImg: null,
      ),
    );
  }

  void _onSelectCoverImg(SelectCoverImg e, Emitter<EditTripState> emit) {
    emit(
      state.copyWith(
        coverStyle: "IMAGE",
        coverType: "IMAGE",
        localImgFile: e.file,
        coverImg: null,
      ),
    );
  }

  void _onRemoveCoverImg(RemoveCoverImg e, Emitter<EditTripState> emit) {
    emit(
      state.copyWith(
        localImgFile: null,
        coverImg: null,
        coverStyle: "IMAGE",
        coverType: "IMAGE",
      ),
    );
  }

  /// 수정 저장 처리
  Future<void> _onSaveTrip(SaveTrip e, Emitter<EditTripState> emit) async {
    if (!state.isValid) {
      emit(
        state.copyWith(
          pageState: EditTripPageState.error,
          message: "입력값이 부족해서 수정할 수 없어요.",
        ),
      );
      return;
    }

    emit(state.copyWith(pageState: EditTripPageState.saving));

    String? coverImageUrl = state.coverImg;

    // COLOR 모드 → 기존 이미지 삭제 처리
    if (state.coverStyle == "COLOR") {
      final originImg = state.originalTrip?.coverImg;
      if (originImg != null &&
          originImg.isNotEmpty &&
          state.localImgFile == null &&
          (state.coverImg == null || state.coverImg!.isEmpty)) {
        final deleteResult = await _tripRepository.deleteImg(originImg);
        deleteResult.when(success: (_) {}, failure: (_) {});
        coverImageUrl = null;
      }
    }

    // IMAGE 모드 + 새 업로드
    if (state.coverStyle == "IMAGE" && state.localImgFile != null) {
      final originImg = state.originalTrip?.coverImg;
      if (originImg != null && originImg.isNotEmpty) {
        await _tripRepository.deleteImg(originImg);
      }

      final uploadResult = await _tripRepository.uploadImg(
        file: state.localImgFile!,
      );

      bool uploadOk = true;
      uploadResult.when(
        success: (url) => coverImageUrl = url,
        failure: (_) => uploadOk = false,
      );
      if (!uploadOk) {
        emit(
          state.copyWith(
            pageState: EditTripPageState.error,
            message: "이미지 업로드에 실패했어요.",
          ),
        );
        return;
      }
    }

    final cleanStart = state.startAt.split('T').first;
    final cleanEnd = state.endAt.split('T').first;

    final entity = state.toEntity().copyWith(
      id: state.originalTrip?.id,
      userId: state.originalTrip?.userId ?? state.userId,
      startAt: cleanStart,
      endAt: cleanEnd,
      coverImg: coverImageUrl,
      country: state.country,
      coverType: state.coverType,
    );

    final result = await _editTripUsecase(entity);

    result.when(
      success: (updated) {
        emit(
          state.copyWith(
            updatedTrip: updated,
            pageState: EditTripPageState.success,
            message: "수정이 완료되었어요!",
          ),
        );
      },
      failure: (err) {
        emit(
          state.copyWith(
            pageState: EditTripPageState.error,
            message: err.message ?? "수정에 실패했어요.",
          ),
        );
      },
    );
  }

  void _onCancelEdit(CancelEdit e, Emitter<EditTripState> emit) {
    if (state.originalTrip != null) {
      add(EditTripEvent.loadTrip(trip: state.originalTrip!));
    }
  }

  void _onReset(Reset e, Emitter<EditTripState> emit) {
    emit(const EditTripState());
  }
}
