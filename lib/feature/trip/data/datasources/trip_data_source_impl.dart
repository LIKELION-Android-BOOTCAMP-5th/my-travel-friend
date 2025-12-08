import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/data/dtos/trip_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'trip_data_source.dart';

// 신강현
// 데이터소스 임플리먼트 작성완료

@LazySingleton(as: TripDataSource)
class TripDataSourceImpl implements TripDataSource {
  final SupabaseClient _supabaseClient;

  TripDataSourceImpl(this._supabaseClient);

  @override
  Future<Result<List<TripDto>>> getMyTrips(int userId, int page) async {
    try {
      const limit = 10;
      final offset = (page - 1) * limit;

      final res = await _supabaseClient
          .from('trip')
          .select('*, trip_crew(count)')
          .eq('trip_crew.member_id', userId)
          .order('created_at', ascending: false)
          .range(offset, offset + limit - 1);

      final trips = (res as List).map((row) {
        return TripDto.fromJson({
          ...row,
          'crew_count': row['trip_crew'][0]['count'],
        });
      }).toList();

      return Result.success(trips);
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

  @override
  Future<Result<List<TripDto>>> searchTrips(
    int userId,
    String keyword,
    int page,
  ) async {
    try {
      const limit = 20;
      final offset = (page - 1) * limit;

      final res = await _supabaseClient
          .from('trip_crew')
          .select('trip(*)')
          .eq('member_id', userId)
          .or('trip.title.ilike.%$keyword%,trip.place.ilike.%$keyword%')
          .order('trip.created_at', ascending: false)
          .range(offset, offset + limit - 1);

      final trips = (res as List)
          .map((row) => TripDto.fromJson(row['trip']))
          .toList();

      return Result.success(trips);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
