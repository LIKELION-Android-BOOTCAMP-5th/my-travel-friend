import 'package:injectable/injectable.dart';

import '../../../../core/result/result.dart';
import '../../domain/entities/chat_entity.dart';
import '../../domain/entities/chat_read_status_entity.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_data_source.dart';
import '../dtos/chat_dto.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatDataSource _dataSource;
  ChatRepositoryImpl(this._dataSource);

  // 채팅 가져오기
  @override
  Future<Result<List<ChatEntity>>> getChat({
    required int tripId,
    required int page,
    required int limit,
  }) async {
    final res = await _dataSource.getChat(
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

  // 채팅 보내기
  @override
  Future<Result<ChatEntity>> sendChat(ChatEntity chat) async {
    final dto = ChatDTO.fromEntity(chat);

    final res = await _dataSource.sendChat(chat: dto);

    return res.when(
      success: (data) => Result.success(data.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // Realtime 구독 - DTO -> Entity 변환
  @override
  Stream<Result<List<ChatEntity>>> subscribeChat({required int tripId}) {
    return _dataSource.subscribeChat(tripId).map((result) {
      return result.when(
        success: (dtos) =>
            Result.success(dtos.map((dto) => dto.toEntity()).toList()),
        failure: (failure) => Result.failure(failure),
      );
    });
  }

  // Realtime 구독 해제
  @override
  Future<void> unsubscribeChat() {
    return _dataSource.unsubscribeChat();
  }

  // 채팅 마지막 읽은 위치 조회
  @override
  Future<Result<ChatReadStatusEntity?>> getReadStatus({
    required int tripId,
    required int userId,
  }) async {
    final res = await _dataSource.getReadStatus(tripId: tripId, userId: userId);

    return res.when(
      success: (dto) => Result.success(dto?.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 채팅 읽음 상태 업데이트
  @override
  Future<Result<ChatReadStatusEntity>> updateReadStatus({
    required int tripId,
    required int userId,
    required int lastReadChatId,
  }) async {
    final res = await _dataSource.updateReadStatus(
      tripId: tripId,
      userId: userId,
      lastReadChatId: lastReadChatId,
    );

    return res.when(
      success: (dto) => Result.success(dto.toEntity()),
      failure: (failure) => Result.failure(failure),
    );
  }

  // 채팅 안 읽은 메시지 개수 조회
  @override
  Future<Result<int>> getUnreadCount({
    required int tripId,
    required int userId,
  }) async {
    return await _dataSource.getUnreadCount(tripId: tripId, userId: userId);
  }
}
