import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';
import 'package:my_travel_friend/feature/schedule/domain/entities/category_entity.dart';
import 'package:my_travel_friend/feature/schedule/domain/entities/schedule_entity.dart';

abstract class ScheduleRepository {
  // 여행에 속한 모든 스케줄 가져오기 (페이징)
  Future<Result<List<ScheduleEntity>>> getAllSchedule(int tripId, int page);

  // 일정 생성 (스케줄 참여 인원도 함께 추가)
  Future<Result<ScheduleEntity>> createSchedule(
    ScheduleEntity schedule,
    List<int> memberIds,
  );

  // 일정 수정 (스케줄 참여 인원도 수정되게)
  Future<Result<ScheduleEntity>> updateSchedule(
    ScheduleEntity schedule,
    List<int> memberIds,
  );

  // 일정 삭제 (해당 스케줄 참여자 레코드도 삭제)
  Future<Result<void>> deleteSchedule(int scheduleId);

  // 스케쥴 ID로 해당 스케줄에 참여하는 유저 가져오기
  Future<Result<List<UserEntity>>> getScheduleMembers(int scheduleId);

  // 여행 ID로 해당 여행에 참여하는 유저 가져오기
  Future<Result<List<UserEntity>>> getTripMembers(int tripId);

  //카테고리 가져오기
  Future<Result<List<CategoryEntity>>> getCategory();

  // 유저 ID로 해당 유저가 참여하는 스케줄 가져오기
  Future<Result<List<ScheduleEntity>>> getUserSchedule({
    required int tripId,
    required int userId,
  });
}
