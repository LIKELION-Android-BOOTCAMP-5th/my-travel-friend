import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/alarm_entity.dart';

part 'alarm_state.freezed.dart';

// [이재은] 알림 페이지 상태

// 네비게이션 상태 (sealed class)
// -Bloc에서 결정, Screen에서 라우팅 수행

sealed class AlarmNavigation {
  const AlarmNavigation();
}

// 네비게이션 없는 기본 상태 -> 초기 혹은 처리 완료 후 리셋
class AlarmNavigationNone extends AlarmNavigation {
  const AlarmNavigationNone();
}

// 이동
// - path : GoRouter 경로
// - extra : 추가 데이터(아이디 정보 등)
class AlarmNavigationTo extends AlarmNavigation {
  final String path;
  const AlarmNavigationTo(this.path);
}

// 알림 페이지 UI 상태
enum AlarmPageState {
  initial,
  loading,
  loaded,
  loadingMore,
  success,
  error,
  detailLoaded,
}

// 알림 전체 상태
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
    // 네비게이션 목적지
    @Default(AlarmNavigationNone()) AlarmNavigation navigation,
  }) = _AlarmState;

  // 읽지 않은 알림 개수
  int get unreadCount => alarms.where((alarm) => !alarm.isChecked).length;

  // 읽지 않은 알림 존재 여부
  bool get hasUnread => unreadCount > 0;
}
