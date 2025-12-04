import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/diary_entity.dart';
import '../../domain/repositories/diary_repository.dart';
import '../datasources/diary_data_source.dart';
import '../dtos/diary_dto.dart';

// [이재은] 다이어리 repository
@LazySingleton(as: DiaryRepository)
class DiaryRepositoryImpl implements DiaryRepository {
  final DiaryDataSource _dataSource;
  DiaryRepositoryImpl(this._dataSource);

  // 공유 다이어리 목록 가져오기
  @override
  Future<Result<List<DiaryEntity>>> getOurDiaries(
    int tripId,
    int page,
    int limit,
  ) async {
    final res = await _dataSource.getOurDiaries(
      tripId: tripId,
      page: page,
      limit: limit,
    );
    return res.when(
      success: (data) =>
          Result.success(data.map((dto) => dto.toEntity()).toList()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 내 다이어리 목록 가져오기
  @override
  Future<Result<List<DiaryEntity>>> getMyDiaries(
    int tripId,
    int userId,
    int page,
    int limit,
  ) async {
    final res = await _dataSource.getMyDiaries(
      tripId: tripId,
      userId: userId,
      page: page,
      limit: limit,
    );
    return res.when(
      success: (data) =>
          Result.success(data.map((dto) => dto.toEntity()).toList()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 다이어리 상세 조회 (아이디로)
  @override
  Future<Result<DiaryEntity>> getDiaryById(int id) async {
    final res = await _dataSource.getDiaryById(id);
    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 다이어리 생성
  @override
  Future<Result<DiaryEntity>> createDiary(DiaryEntity diary) async {
    final dto = DiaryDTO.fromEntity(diary);

    final res = await _dataSource.createDiary(dto);
    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 다이어리 수정
  @override
  Future<Result<DiaryEntity>> updateDiary(DiaryEntity diary) async {
    final dto = DiaryDTO.fromEntity(diary);

    final res = await _dataSource.updateDiary(dto);
    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 다이어리 삭제
  @override
  Future<Result<void>> deleteDiary(int id) async {
    return await _dataSource.deleteDiary(id);
  }

  // 이미지 업로드
  @override
  Future<Result<String>> uploadImg({
    required File file,
    required int userId,
  }) async {
    return await _dataSource.uploadImg(file: file, userId: userId);
  }

  // 이미지 삭제
  @override
  Future<Result<void>> deleteImg(String imgUrl) async {
    return await _dataSource.deleteImg(imgUrl);
  }
}
