import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/diary_entity.dart';

part 'edit_diary_event.freezed.dart';

// [이재은] 다이어리 수정 관련 이벤트

@freezed
abstract class EditDiaryEvent with _$EditDiaryEvent {
  // 다이어리 수정
  // - 바텀시트 -> 수정버튼 -> 수정화면 -> 저장 버튼 클릭시 호출
  // - 기존 다이어리 내용 업데이트
  const factory EditDiaryEvent.updateDiary({required DiaryEntity diary}) =
      UpdateDiary;

  // 상태 초기화
  const factory EditDiaryEvent.reset() = ResetEditDiary;
}
