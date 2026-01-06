import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';

import '../../../../auth/domain/entities/user_entity.dart';

part 'create_trip_state.freezed.dart';

@freezed
abstract class CreateTripState with _$CreateTripState {
  const CreateTripState._();

  const factory CreateTripState({
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

    TripEntity? createTrip,

    int? friendId,
    UserEntity? friendUser,
    // 메세지 (성공/에러)
    String? message,
    String? errorType,
    String? actionType,

    @Default(false) bool isSameDay,
    @Default(false) bool showSameDayDialog,

    // 이미지 업로드 상태 (추가)
    @Default(false) bool isUploading,
    // 페이지 상태
    @Default(CreateTripPageState.init) CreateTripPageState pageState,
  }) = _CreateTripState;

  TripEntity toEntity() {
    return TripEntity(
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

extension CreateTripValidation on CreateTripState {
  bool get isValid {
    final hasTitle = title.isNotEmpty;
    final hasPlace = place.isNotEmpty;
    final hasDate = startAt.isNotEmpty && endAt.isNotEmpty;

    final isCoverValid = coverStyle == "COLOR"
        ? coverType.isNotEmpty
        : localImgFile != null || (coverImg?.isNotEmpty ?? false);

    return hasTitle && hasPlace && hasDate && isCoverValid;
  }
}

enum CreateTripPageState {
  init, // 초기 상태
  loading, // 로딩 중
  success, // 생성 성공
  error, // 에러
}
