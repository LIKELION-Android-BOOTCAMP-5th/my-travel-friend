import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/auth/data/models/user_model.dart';
import 'package:my_travel_friend/feature/schedule/data/datasources/schedule_data_source.dart';
import 'package:my_travel_friend/feature/schedule/data/dtos/category_dto.dart';
import 'package:my_travel_friend/feature/schedule/data/dtos/schedule_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';

@LazySingleton(as: ScheduleDataSource)
class ScheduleDataSourceImpl implements ScheduleDataSource {
  final SupabaseClient supabase;

  ScheduleDataSourceImpl({required this.supabase});

  @override
  Future<Result<List<ScheduleDTO>>> getAllSchedule({
    required int tripId,
    required int page,
  }) async {
    try {
      final res = await supabase
          .from('schedule')
          .select('*')
          .eq('trip_id', tripId)
          .order('date', ascending: true)
          .range(page * 10, page * 10 + 9); // 10개씩 페이징

      final data = (res as List)
          .map((json) => ScheduleDTO.fromJson(json))
          .toList();

      return Result.success(data);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<ScheduleDTO>> createSchedule({
    required ScheduleDTO schedule,
    required List<int> memberIds,
  }) async {
    try {
      // 1) 스케줄 insert
      final res = await supabase
          .from('schedule')
          .insert({
            'trip_id': schedule.tripId,
            'title': schedule.title,
            'date': schedule.date,
            'place': schedule.place,
            'address': schedule.address,
            'lat': schedule.lat,
            'lng': schedule.lng,
            'description': schedule.description,
            'category_id': schedule.categoryId,
          })
          .select()
          .single();

      final newSchedule = ScheduleDTO.fromJson(res);
      final scheduleId = newSchedule.id!;

      // 2) schedul_crew insert
      if (memberIds.isNotEmpty) {
        final members = memberIds
            .map((id) => {"schedule_id": scheduleId, "member_id": id})
            .toList();

        await supabase.from('schedule_crew').insert(members);
      }

      return Result.success(newSchedule);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<ScheduleDTO>> updateSchedule({
    required ScheduleDTO schedule,
    required List<int> memberIds,
  }) async {
    try {
      // 1) 스케줄 수정
      final res = await supabase
          .from('schedule')
          .update(schedule.toJson())
          .eq('id', schedule.id!)
          .select()
          .single();

      final updated = ScheduleDTO.fromJson(res);

      // 2) 기존 멤버 제거 + 새로운 멤버 저장
      await supabase
          .from('schedule_crew')
          .delete()
          .eq('schedule_id', schedule.id!);

      if (memberIds.isNotEmpty) {
        final members = memberIds
            .map((id) => {"schedule_id": schedule.id, "member_id": id})
            .toList();

        await supabase.from('schedule_crew').insert(members);
      }

      return Result.success(updated);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteSchedule({required int scheduleId}) async {
    try {
      final crewRes = await supabase
          .from('schedule_crew')
          .delete()
          .eq('schedule_id', scheduleId);

      final scheduleRes = await supabase
          .from('schedule')
          .delete()
          .eq('id', scheduleId);

      return Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<List<UserDTO>>> getScheduleMembers({
    required int scheduleId,
  }) async {
    try {
      final res = await supabase
          .from('schedule_crew')
          .select('member_id, user:member_id (id, nickname, profile_img)')
          .eq('schedule_id', scheduleId);

      final data = (res as List)
          .map((row) => UserDTO.fromJson(row['user']))
          .toList();

      return Result.success(data);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<List<UserDTO>>> getTripMembers({required int tripId}) async {
    try {
      final res = await supabase
          .from('trip_crew')
          .select('member_id, user:member_id (id, nickname, profile_img)')
          .eq('trip_id', tripId);

      final data = (res as List)
          .map((row) => UserDTO.fromJson(row['user']))
          .toList();

      return Result.success(data);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<List<CategoryDTO>>> getCategory() async {
    try {
      final res = await supabase.from('category').select('id,content');

      final data = (res as List)
          .map((row) => CategoryDTO.fromJson(row))
          .toList();

      return Result.success(data);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // [이재은] 여행 ID와 유저 ID로 해당 유저가 참여하는 스케줄 가져오기
  @override
  Future<Result<List<ScheduleDTO>>> getUserSchedule({
    required int tripId,
    required int userId,
  }) async {
    try {
      // schedul_crew를 inner join으로 필터링
      final response = await supabase
          .from('schedule')
          .select('*, schedule_crew!inner(member_id)')
          .eq('trip_id', tripId)
          .eq('schedule_crew.member_id', userId)
          .order('date', ascending: true);

      final schedules = (response as List)
          .map((e) => ScheduleDTO.fromJson(e))
          .toList();

      return Result.success(schedules);
    } catch (e) {
      return Result.failure(Failure.undefined(message: '스케줄을 불러오는데 실패했어요: $e'));
    }
  }
}
