import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../dtos/trip_request_dto.dart';
import 'trip_request_data_source.dart';

///[엄수빈] 여행 요청 데이터 소스 구현
@LazySingleton(as: TripRequestDataSource)
class TripRequestDataSourceImpl implements TripRequestDataSource {
  final SupabaseClient _supabaseClient;
  TripRequestDataSourceImpl(this._supabaseClient);

  static const String _table = 'trip_request';

  //요청 목록 가져오기
  @override
  Future<Result<List<TripRequestDto>>> getTripRequest(int myId) async {
    try {
      final res = await _supabaseClient
          .from(_table)
          .select()
          .eq('target_id', myId)
          .isFilter('answered_at', null)
          .order('created_at', ascending: false);

      final list = (res as List)
          .map((json) => TripRequestDto.fromJson(json))
          .toList();

      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 요청 보내기
  @override
  Future<Result<TripRequestDto>> createTripRequest(
    int requestId,
    int targetId,
    int tripId,
  ) async {
    try {
      final insertData = {
        'request_id': requestId,
        'target_id': targetId,
        'trip_id': tripId,
      };

      final res = await _supabaseClient
          .from(_table)
          .insert(insertData)
          .select()
          .maybeSingle();

      if (res == null) {
        return Result.failure(const Failure.serverFailure(message: '요청 실패'));
      }

      final entity = TripRequestDto.fromJson(res);
      return Result.success(entity);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 요청 수락
  @override
  Future<Result<void>> acceptTripRequest(int id) async {
    try {
      await _supabaseClient
          .from(_table)
          .update({'answered_at': DateTime.now().toIso8601String()})
          .eq('id', id);

      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  //요청 삭제
  @override
  Future<Result<void>> deleteTripRequst(int id) async {
    try {
      await _supabaseClient.from(_table).delete().eq('id', id);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 이미 보낸 요청
  @override
  Future<Result<List<TripRequestDto>>> getPendingInvites(int tripId) async {
    try {
      final res = await _supabaseClient
          .from(_table)
          .select()
          .eq('trip_id', tripId)
          .isFilter('answered_at', null)
          .order('created_at', ascending: false);

      final list = (res as List)
          .map((e) => TripRequestDto.fromJson(e as Map<String, dynamic>))
          .toList();

      return Result.success(list);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
