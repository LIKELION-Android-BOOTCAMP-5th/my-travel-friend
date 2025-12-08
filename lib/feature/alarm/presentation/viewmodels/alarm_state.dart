import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/alarm_entity.dart';

part 'alarm_state.freezed.dart';

// [이재은] 알림 페이지 상태
enum AlarmPageState {
  initial,
  loading,
  loaded,
  loadingMore,
  success,
  error,
  detailLoaded,
}

@freezed
abstract class AlarmState with _$AlarmState {
  const AlarmState._();

  const factory AlarmState({
    // 사용자 정보
    @Default(0) int userId,
    // 페이지 상태
    @Default(AlarmPageState.initial) AlarmPageState pageState,
    // 알림 목록
    @Default([]) List<AlarmEntity> alarms,
    // 상세 조회용
    AlarmEntity? selectedAlarm,
    // 페이지네이션
    @Default(0) int currentPage,
    @Default(false) bool hasMore,
    // 메세지(성공/에러)
    String? message,
  }) = _AlarmState;

  // 읽지 않은 알림 개수
  int get unreadCount => alarms.where((alarm) => !alarm.isChecked).length;

  // 읽지 않은 알림 존재 여부
  bool get hasUnread => unreadCount > 0;
}
