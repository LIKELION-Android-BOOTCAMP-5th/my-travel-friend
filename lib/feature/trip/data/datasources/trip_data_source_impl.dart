import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/data/dtos/trip_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'trip_data_source.dart';

// 신강현
// 데이터소스 임플리먼트 작성완료

@lazySingleton
class TripDataSourceImpl implements TripDataSource {
  final SupabaseClient _supabaseClient;

  TripDataSourceImpl(this._supabaseClient);

  @override
  Future<Result<List<TripDto>>> getMyTrips(int userId) async {
    try {
      // 유저가 참가한 트립id 가져오기
      final crewRes = await _supabaseClient
          .from('trip_crew')
          .select('trip_id')
          .eq('member_id', userId);
      //트립id만 리스트로 정리
      final List<int> tripIds = crewRes
          .map<int>((row) => row['trip_id'] as int)
          .toList();
      if (tripIds.isEmpty) return Result.success([]);

      // infilter로 tripIds 에 있는 id와 같은 id를 가진 여행테이블 테이블 가져오기
      final res = await _supabaseClient
          .from('trip')
          .select()
          .inFilter('id', tripIds);
      //가져온 데이터 TripDto로 반환해주기
      final list = (res as List).map((json) => TripDto.fromJson(json)).toList();
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<TripDto>> createTrip(TripDto trip) async {
    try {
      final res = await _supabaseClient
          .from('trip')
          .insert(trip.toJson())
          .select()
          .single();
      final list = TripDto.fromJson(res);
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<TripDto>> editTrip(TripDto trip) async {
    try {
      final res = await _supabaseClient
          .from('trip')
          .update(trip.toJson())
          .eq('id', trip.id!)
          .select()
          .single();
      final list = TripDto.fromJson(res);
      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> giveUpTrip(int userId, int tripId) async {
    try {
      await _supabaseClient
          .from('trip_crew')
          .delete()
          .eq('member_id', userId)
          .eq('trip_id', tripId);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteTrip(int tripId) async {
    try {
      await _supabaseClient.from('trip').delete().eq('id', tripId);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<int>> countTripCrew(int tripId) async {
    try {
      final crew = await _supabaseClient
          .from('trip_crew')
          .select('id')
          .eq('trip_id', tripId);
      final int crewmember = crew.length;

      return Result.success(crewmember);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
