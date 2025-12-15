import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_read_status_entity.freezed.dart';

// [이재은] 채팅 읽음 상태 Entity

@freezed
abstract class ChatReadStatusEntity with _$ChatReadStatusEntity {
  const factory ChatReadStatusEntity({
    int? id,
    required int tripId,
    required int userId,
    int? lastReadChatId,
    String? lastReadAt,
  }) = _ChatReadStatusEntity;
}
