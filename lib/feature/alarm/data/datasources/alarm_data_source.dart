import '../../../../core/result/result.dart';
import '../dtos/alarm_dto.dart';

// [이재은] 알림 관련 데이터 소스 (추상)
abstract class AlarmDataSource {
  // 알람 리스트 조회 (로그인 유저 ID로)
  Future<Result<List<AlarmDTO>>> getAlarms({
    required int userId,
    required int page,
    required int limit,
  });

  // 알림 상세 조회
  Future<Result<AlarmDTO>> getAlarmById(int id);

  // 알림 하나 읽음 처리
  Future<Result<List<AlarmDTO>>> checkAnAlarm(int id);

  // 알림 전체 읽음 처리
  Future<Result<List<AlarmDTO>>> checkAlarms(int userId);

  // 리얼타임 구독
  Stream<Result<List<AlarmDTO>>> watchAlarms(int userId);

  // 구독 해제
  Future<void> unsubscribeAlarms();
}
