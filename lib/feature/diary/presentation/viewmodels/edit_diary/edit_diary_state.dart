import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/diary_entity.dart';

part 'edit_diary_state.freezed.dart';

// [이재은] 다이어리 수정창 전체 상태

@freezed
abstract class EditDiaryState with _$EditDiaryState {
  const EditDiaryState._();

  const factory EditDiaryState({
    // 다이어리 ID (수정 대상)
    int? diaryId,

    // 여행, 사용자 정보
    @Default(0) int tripId,
    @Default(0) int userId,

    // 원본 다이어리 (비교용)
    DiaryEntity? originalDiary,

    // 폼 입력 값
    @Default('MEMO') String type,
    @Default('') String title,
    @Default('') String content,
    @Default(0.0) double rating,
    String? imgUrl, // 기존 이미지 URL (서버에서 로드)
    File? localImgFile, // 새로 선택한 로컬 이미지
    int? cost,
    @Default(true) bool isPublic,
    int? scheduleId,

    // 수정된 다이어리
    DiaryEntity? updatedDiary,

    // 메세지 (성공/에러)
    String? message,
    String? errorType,
    String? actionType,

    // 이미지 업로드 상태
    @Default(false) bool isUploading,

    // 페이지 상태
    @Default(EditDiaryPageState.init) EditDiaryPageState pageState,
  }) = _EditDiaryState;

  // 저장 버튼 활성화를 위한 유효성 검사
  bool get canSave {
    switch (type) {
      case 'MEMO':
        return content.trim().isNotEmpty;
      case 'REVIEW':
        return rating > 0;
      case 'PHOTO':
        // 로컬 이미지가 있거나 기존 URL이 있으면 저장 가능
        return localImgFile != null || (imgUrl != null && imgUrl!.isNotEmpty);
      case 'MONEY':
        return cost != null && cost! > 0;
      default:
        return false;
    }
  }

  // DiaryEntity로 변환 (수정용)
  DiaryEntity toEntity() {
    return DiaryEntity(
      id: diaryId,
      tripId: tripId,
      userId: userId,
      type: type,
      title: title.isNotEmpty ? title : null,
      content: content.isNotEmpty ? content : null,
      rating: type == 'REVIEW' ? rating.toDouble() : null,
      img: type == 'PHOTO' ? imgUrl : null,
      cost: type == 'MONEY' ? cost : null,
      isPublic: isPublic,
    );
  }
}

// [이재은] 다이어리 페이지 상태 (UI 상태)
enum EditDiaryPageState { init, loading, success, error }
