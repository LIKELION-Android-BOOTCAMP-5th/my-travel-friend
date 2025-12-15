import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/chat_read_status_entity.dart';

part 'chat_read_status_dto.freezed.dart';
part 'chat_read_status_dto.g.dart';

// [이재은] 채팅 읽음 상태 DTO

@freezed
abstract class ChatReadStatusDTO with _$ChatReadStatusDTO {
  const ChatReadStatusDTO._();

  const factory ChatReadStatusDTO({
    int? id,
    @JsonKey(name: 'trip_id') required int tripId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'last_read_chat_id') int? lastReadChatId,
    @JsonKey(name: 'last_read_at') String? lastReadAt,
  }) = _ChatReadStatusDTO;

  factory ChatReadStatusDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatReadStatusDTOFromJson(json);

  factory ChatReadStatusDTO.fromEntity(ChatReadStatusEntity entity) {
    return ChatReadStatusDTO(
      id: entity.id,
      tripId: entity.tripId,
      userId: entity.userId,
      lastReadChatId: entity.lastReadChatId,
      lastReadAt: entity.lastReadAt,
    );
  }

  ChatReadStatusEntity toEntity() {
    return ChatReadStatusEntity(
      id: id,
      tripId: tripId,
      userId: userId,
      lastReadChatId: lastReadChatId,
      lastReadAt: lastReadAt,
    );
  }
}
