import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/extension/extract_Url_path_extension.dart';
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

  // Storage 버킷 이름
  static const String _bucketName = 'trip_cover_image';

  @override
  Future<Result<List<TripDto>>> getMyTrips(int userId, int page) async {
    try {
      const limit = 10;
      final offset = (page - 1) * limit;

      final res = await _supabaseClient
          .from('trip')
          .select('''
      *,
      crew_count:trip_crew(count)
    ''')
          .eq('trip_crew.member_id', userId)
          .order('created_at', ascending: false)
          .range(offset, offset + limit - 1);

      final trips = (res as List).map((row) {
        final crew = row['crew_count'] as List?;
        final crewCnt = (crew != null && crew.isNotEmpty)
            ? crew.first['count'] as int
            : 1;
        return TripDto.fromJson({...row, 'crew_count': crewCnt});
      }).toList();

      return Result.success(trips);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<TripDto>> createTrip(TripDto trip) async {
    try {
      //  trip 먼저 생성
      final res = await _supabaseClient
          .from('trip')
          .insert({
            "title": trip.title,
            "place": trip.place,
            "start_at": trip.startAt,
            "end_at": trip.endAt,
            "cover_type": trip.coverType,
            "cover_img": trip.coverImg,
            "user_id": trip.userId,
            "country": trip.country,
          })
          .select()
          .single();

      final createdTrip = TripDto.fromJson(res);

      //  trip_crew에 자기 자신 추가
      await _supabaseClient.from('trip_crew').insert({
        "trip_id": createdTrip.id,
        "member_id": trip.userId,
      });

      return Result.success(createdTrip);
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

  // 이미지 업로드
  @override
  Future<Result<String>> uploadImg({required File file}) async {
    try {
      // 파일 이름 생성 : timestamp_userID.jpg
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = '${timestamp}_.jpg';

      final storagePath = '$fileName';

      // 업로드
      await _supabaseClient.storage.from(_bucketName).upload(storagePath, file);

      // 공개 URL 생성
      final publicUrl = _supabaseClient.storage
          .from(_bucketName)
          .getPublicUrl(storagePath);

      return Result.success(publicUrl);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: '이미지 업로드 실패 : $e'));
    }
  }

  // 이미지 삭제
  @override
  Future<Result<void>> deleteImg(String imgUrl) async {
    try {
      // URL에서 storage path 추출
      final storagePath = imgUrl.extractStoragePath(_bucketName);

      if (storagePath == null) {
        return Result.failure(
          const Failure.undefined(message: '유효하지 않은 이미지 URL'),
        );
      }

      await _supabaseClient.storage.from(_bucketName).remove([storagePath]);

      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: "이미지 삭제 실패 : $e"));
    }
  }
}
