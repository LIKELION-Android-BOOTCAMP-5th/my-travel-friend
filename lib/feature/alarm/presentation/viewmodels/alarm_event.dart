import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/alarm_entity.dart';

part 'alarm_event.freezed.dart';

// [이재은] 알림 이벤트

@freezed
class AlarmEvent with _$AlarmEvent {
  // 알림 목록 조회
  const factory AlarmEvent.getAlarms({required int userId}) = GetAlarms;

  // 알림 목록 더 불러오기 (무한스크롤)
  // userId state에서 가져오기
  const factory AlarmEvent.loadMore() = LoadMoreAlarms;

  // 알림 하나 읽음 처리(클릭 시)
  const factory AlarmEvent.checkAnAlarm({required int alarmId}) = CheckAnAlarm;

  // 알림 전체 읽음 처리
  // userId state에서 가져오기
  const factory AlarmEvent.checkAlarms() = CheckAlarms;

  // 알림 상세 조회 (라우팅)
  const factory AlarmEvent.getAlarmById({required int alarmId}) = GetAlarmById;

  // 선택된 알림 초기화
  const factory AlarmEvent.clearSelectedAlarm() = ClearSelectedAlarm;

  // 새로고침
  const factory AlarmEvent.refreshAlarm() = RefreshAlarm;

  // 네비게이션 이동 요청
  const factory AlarmEvent.requestNavigate({required AlarmEntity alarm}) =
      RequestNavigate;

  // 네비게이션 처리완료(플래그 초기화)
  const factory AlarmEvent.navigationHandled() = NavigationHandled;
}
