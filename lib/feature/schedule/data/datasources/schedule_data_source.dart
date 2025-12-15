import 'package:my_travel_friend/feature/auth/data/models/user_model.dart';
import 'package:my_travel_friend/feature/schedule/data/dtos/category_dto.dart';
import 'package:my_travel_friend/feature/schedule/data/dtos/schedule_dto.dart';

import '../../../../core/result/result.dart';

abstract class ScheduleDataSource {
  // 여행에 속한 모든 스케줄 가져오기 (페이징)
  Future<Result<List<ScheduleDTO>>> getAllSchedule({
    required int tripId,
    required int page,
  });

  // 일정 생성 (스케줄 참여 인원도 함께 추가)
  Future<Result<ScheduleDTO>> createSchedule({
    required ScheduleDTO schedule,
    required List<int> memberIds,
  });

  // 일정 수정 (스케줄 참여 인원도 수정되게)
  Future<Result<ScheduleDTO>> updateSchedule({
    required ScheduleDTO schedule,
    required List<int> memberIds,
  });

  // 일정 삭제 (해당 스케줄 참여자 레코드도 삭제)
  Future<Result<void>> deleteSchedule({required int scheduleId});

  //스케줄 ID로 해당 스케줄 참여 유저 가져오기
  Future<Result<List<UserDTO>>> getScheduleMembers({required int scheduleId});

  //여행 ID로 해당 여행에 참여 유저 가져오기
  Future<Result<List<UserDTO>>> getTripMembers({required int tripId});

  //[이재은] 여행 ID와 유저 ID로 해당 유저의 해당 여행 중 스케줄 가져오기
  Future<Result<List<ScheduleDTO>>> getUserSchedule({
    required int tripId,
    required int userId,
  });
  //카테고리 가져와서 저장해놓기
  Future<Result<List<CategoryDTO>>> getCategory();
}
