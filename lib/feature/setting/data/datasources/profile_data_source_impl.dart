import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/setting/data/datasources/profile_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/extension/extract_Url_path_extension.dart';
import '../../../../core/result/failures.dart';
import '../../../../core/result/result.dart';
import '../../../auth/data/models/user_model.dart';

// [이재은] 프로필 설정 관련 데이터 소스 (구현체)
@LazySingleton(as: ProfileDataSource)
class ProfileDataSourceImpl implements ProfileDataSource {
  // Supabase 의존성 주입
  final SupabaseClient _supabaseClient;
  ProfileDataSourceImpl(this._supabaseClient);

  // Storage 버킷 이름
  static const String _bucketName = 'profile_imgs';

  // 프로필 업데이트
  @override
  Future<Result<UserDTO>> updateProfile(UserDTO profile) async {
    try {
      final updateData = profile.toJson()
        ..remove('id')
        ..remove('created_at');

      final res = await _supabaseClient
          .from('user')
          .update(updateData)
          .eq('id', profile.id!)
          .select()
          .single();

      final result = UserDTO.fromJson(res);
      return Result.success(result);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }

  // 이미지 업로드
  @override
  Future<Result<String>> uploadImg({
    required File file,
    required int id,
  }) async {
    try {
      // 파일 이름 생성 : timestamp_userID.jpg
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = '${timestamp}_${id}.jpg';

      // 전체 경로 : userUuid / fileName
      final storagePath = '$id/$fileName';

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

  // 닉네임 중복 체크
  @override
  Future<Result<bool>> checkNicknameDuplicate(String nickname) async {
    try {
      final res = await _supabaseClient
          .from('user')
          .select('id')
          .eq('nickname', nickname)
          .maybeSingle();

      final isDuplicate = res != null;
      return Result.success(isDuplicate);
    } catch (e) {
      return Result.failure(Failure.serverFailure(message: e.toString()));
    }
  }
}
