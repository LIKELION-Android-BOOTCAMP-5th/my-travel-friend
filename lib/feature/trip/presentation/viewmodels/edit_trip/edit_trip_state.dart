import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';

part 'edit_trip_state.freezed.dart';

@freezed
abstract class EditTripState with _$EditTripState {
  const EditTripState._();

  const factory EditTripState({
    // 기존 trip 로드된 값
    TripEntity? originalTrip,
    int? tripId,
    // 수정할 Trip 정보
    @Default(0) int userId,
    @Default('') String title,
    @Default('') String place,
    @Default('') String startAt,
    @Default('') String endAt,
    @Default('BLUE') String coverType,
    @Default('') String country,
    @Default('COLOR') String coverStyle,
    String? coverImg,
    File? localImgFile,

    // 삭제 예정 이미지 url 목록
    @Default([]) List<String> deletedImages,

    // 수정 완료된 Trip 반환
    TripEntity? updatedTrip,

    // State Info
    String? message,
    String? errorType,
    String? actionType,

    @Default(false) bool isSameDay,
    @Default(false) bool showSameDayDialog,

    @Default(false) bool isUploading,

    @Default(EditTripPageState.init) EditTripPageState pageState,
  }) = _EditTripState;

  //UI에서 저장 시 entity로 변환
  TripEntity toEntity() {
    return TripEntity(
      id: tripId ?? originalTrip?.id,
      title: title,
      place: place,
      startAt: startAt,
      endAt: endAt,
      coverType: coverType,
      coverImg: coverImg,
      userId: userId,
      country: country,
    );
  }
}

/// 수정하기 화면 Validation
extension EditTripValidation on EditTripState {
  bool get isValid {
    return title.isNotEmpty &&
        place.isNotEmpty &&
        startAt.isNotEmpty &&
        endAt.isNotEmpty &&
        (coverStyle == "COLOR"
            ? coverType.isNotEmpty
            : localImgFile != null || (coverImg?.isNotEmpty ?? false));
  }
}

enum EditTripPageState {
  init,
  loading,
  loaded, // 기존 trip 로드 완료
  saving, // 저장 중
  success, // 수정 성공
  error,
}
