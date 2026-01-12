import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../dtos/trip_crew_dto.dart';
import 'trip_crew_data_source.dart';

//[엄수빈] 크루원 데이터 소스 구현
@LazySingleton(as: TripCrewDataSource)
class TripCrewDataSourceImpl implements TripCrewDataSource {
  final SupabaseClient _supabaseClient;

  TripCrewDataSourceImpl(this._supabaseClient);

  static const String _table = 'trip_crew';

  @override
  Future<Result<List<TripCrewDTO>>> getTripCrew(int tripId) async {
    try {
      final res = await _supabaseClient
          .from(_table)
          .select()
          .eq('trip_id', tripId);

      final list = (res as List)
          .map((e) => TripCrewDTO.fromJson(e as Map<String, dynamic>))
          .toList();

      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // trip_crew에 추가하기
  @override
  Future<Result<void>> addTrip(int tripId, int myId) async {
    try {
      await _supabaseClient.from(_table).insert({
        'trip_id': tripId,
        'member_id': myId,
      });

      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
