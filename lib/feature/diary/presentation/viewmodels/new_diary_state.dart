import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/diary_entity.dart';

part 'new_diary_state.freezed.dart';

// [이재은] 다이어리 전체 상태

@freezed
abstract class NewDiaryState with _$NewDiaryState {
  const NewDiaryState._();

  const factory NewDiaryState({
    // 여행, 사용자 정보
    @Default(0) int tripId,
    @Default(0) int userId,

    // 폼 입력 값
    @Default('MEMO') String type,
    @Default('') String title,
    @Default('') String content,
    @Default(0.0) double rating,
    String? imgUrl,
    int? cost,
    @Default(true) bool isPublic,
    int? scheduleId,

    // 생성된 다이어리
    DiaryEntity? createdDiary,

    // 메세지 (성공/에러)
    String? message,
    String? errorType,
    String? actionType,

    // 페이지 상태
    @Default(NewDiaryPageState.init) NewDiaryPageState pageState,
  }) = _NewDiaryState;

  // 저장 버튼 활성화를 위한 유효성 검사
  bool get canSave {
    switch (type) {
      case 'MEMO':
        return content.trim().isNotEmpty;
      case 'REVIEW':
        return rating > 0;
      case 'PHOTO':
        return imgUrl != null && imgUrl!.isNotEmpty;
      case 'MONEY':
        return cost != null && cost! > 0;
      default:
        return false;
    }
  }

  // DiaryEntity로 변환
  DiaryEntity toEntity() {
    return DiaryEntity(
      tripId: tripId,
      userId: userId,
      type: type,
      title: title.isNotEmpty ? title : null,
      content: content.isNotEmpty ? content : null,
      rating: type == 'REVIEW' ? rating.toInt() : null,
      img: type == 'PHOTO' ? imgUrl : null,
      cost: type == 'MONEY' ? cost : null,
      isPublic: isPublic,
    );
  }
}

// [이재은] 다이어리 페이지 상태 (UI 상태)
enum NewDiaryPageState {
  init, // 초기 상태
  loading, // 로딩 중
  success, // 생성 성공
  error, // 에러
}
