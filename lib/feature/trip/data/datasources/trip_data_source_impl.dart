import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/data/dtos/trip_dto.dart';
import 'package:my_travel_friend/feature/trip/data/dtos/useful_pharse_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/service/internal/supabase_storage_service.dart';
import 'trip_data_source.dart';

// 신강현
// 데이터소스 임플리먼트 작성완료

@LazySingleton(as: TripDataSource)
class TripDataSourceImpl implements TripDataSource {
  final SupabaseClient _supabaseClient;
  final SupabaseStorageService _storageService;

  TripDataSourceImpl(this._supabaseClient, this._storageService);

  // Storage 버킷 이름
  static const String _bucketName = 'trip_cover_image';

  @override
  Future<Result<List<TripDto>>> getMyTrips(int userId, int page) async {
    try {
      const limit = 10;
      final offset = (page - 1) * limit;

      final res = await _supabaseClient
          .from('trip_crew')
          .select('''
          trip (
            id,
            created_at,
            title,
            place,
            start_at,
            end_at,
            cover_type,
            cover_img,
            user_id,
            country,
            trip_crew (member_id)
          )
        ''')
          .eq('member_id', userId)
          .order('trip(created_at)', ascending: false)
          .range(offset, offset + limit - 1);

      final trips = (res as List).map((row) {
        final tripData = row['trip'];

        final crewList = tripData['trip_crew'] as List? ?? [];
        final crewCount = crewList.length;

        return TripDto.fromJson({...tripData, 'crew_count': crewCount});
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
          .update({
            "title": trip.title,
            "place": trip.place,
            "country": trip.country,
            "start_at": trip.startAt,
            "end_at": trip.endAt,
            "cover_type": trip.coverType,
            "cover_img": trip.coverImg,
          })
          .eq('id', trip.id!)
          .select('*')
          .single();

      final dto = TripDto.fromJson(res);
      return Result.success(dto);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> giveUpTrip(int tripId, int userId) async {
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
          .select('member_id')
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
          .from('trip')
          .select('*, trip_crew!inner(member_id)')
          .eq('trip_crew.member_id', userId)
          .or('title.ilike.%$keyword%,place.ilike.%$keyword%')
          .order('created_at', ascending: false)
          .range(offset, offset + limit - 1);

      final trips = (res as List).map((e) => TripDto.fromJson(e)).toList();

      return Result.success(trips);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<String>> uploadImg({
    required File file,
    required String bucketName,
  }) async {
    try {
      final url = await _storageService.uploadImage(
        file,
        bucketName: _bucketName,
      );
      return Result.success(url);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteImg(
    String imgUrl, {
    required String bucketName,
  }) async {
    try {
      await _storageService.deleteImage(imgUrl, bucketName: _bucketName);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 아이디로 여행 정보 가져오기
  @override
  Future<TripDto> getTripById(int tripId) async {
    try {
      print(' TripDataSource getTripById start');

      final response = await _supabaseClient
          .from('trip')
          .select()
          .eq('id', tripId)
          .maybeSingle();

      print(' TripDataSource response = $response');

      if (response == null) {
        throw Exception('Trip not found. tripId=$tripId');
      }

      return TripDto.fromJson(response);
    } catch (e) {
      print('TripDataSource error: $e');
      rethrow;
    }
  }

  @override
  Future<Result<List<UsefulPharseDTO>>> getUsefulPhrasesByTrip(
    int tripId,
  ) async {
    try {
      final tripRes = await _supabaseClient
          .from('trip')
          .select('country')
          .eq('id', tripId)
          .maybeSingle();

      if (tripRes == null || tripRes['country'] == null) {
        throw Exception('Trip country not found. tripId=$tripId');
      }

      final String country = tripRes['country'];

      final phraseRes = await _supabaseClient
          .from('useful_pharse')
          .select()
          .eq('country', country)
          .order('id', ascending: true);

      final phrases = (phraseRes as List)
          .map((e) => UsefulPharseDTO.fromJson(e))
          .toList();

      return Result.success(phrases);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
