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
  const factory AlarmState({
    @Default(AlarmPageState.initial) AlarmPageState pageState,
    @Default([]) List<AlarmEntity> alarms,
    AlarmEntity? selectedAlarm,
    @Default(0) int currentPage,
    @Default(false) bool hasMore,
    String? message,
  }) = _AlarmState;
}
