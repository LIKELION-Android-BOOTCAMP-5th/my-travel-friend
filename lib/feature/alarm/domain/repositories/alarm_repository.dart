import '../../../../core/result/result.dart';
import '../entities/alarm_entity.dart';

// [이재은] 알림 관련 domain repositories
abstract class AlarmRepository {
  // 알림 리스트 가져오기
  Future<Result<List<AlarmEntity>>> getAlarms(int userId, int page, int limit);

  // 알림 리스트 상세 확인
  Future<Result<AlarmEntity>> getAlarmById(int alarmId);

  // 알림 하나 읽음 처리
  Future<Result<List<AlarmEntity>>> checkAnAlarm(int alarmId);

  // 알림 리스트 전체 읽음 처리
  Future<Result<List<AlarmEntity>>> checkAlarms(int userId);

  // Realtime 스트림
  Stream<Result<List<AlarmEntity>>> watchAlarms(int userId);

  // 구독해제
  Future<void> unsubscribeAlarms();
}
