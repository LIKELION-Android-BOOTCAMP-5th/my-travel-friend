import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/data/models/user_model.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/entities/chat_entity.dart';

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

// [이재은] 채팅 DTO

@freezed
abstract class ChatDTO with _$ChatDTO {
  const ChatDTO._();

  const factory ChatDTO({
    int? id,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'trip_id') required int tripId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'content') required String message,
    @JsonKey(name: 'user') Map<String, dynamic>? userJson,
  }) = _ChatDTO;

  factory ChatDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatDTOFromJson(json);

  factory ChatDTO.fromEntity(ChatEntity entity) {
    return ChatDTO(
      id: entity.id,
      createdAt: entity.createdAt,
      tripId: entity.tripId,
      userId: entity.userId,
      message: entity.message,
    );
  }

  ChatEntity toEntity() {
    UserEntity? userEntity;
    if (userJson != null) {
      userEntity = UserDTO.fromJson(userJson!).toEntity();
    }

    return ChatEntity(
      id: id,
      createdAt: createdAt,
      tripId: tripId,
      userId: userId,
      message: message,
      user: userEntity,
    );
  }
}
