import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_entity.freezed.dart';

// [이재은] : 채팅 entity

@freezed
abstract class ChatEntity with _$ChatEntity {
  const factory ChatEntity({
    int? id,
    String? createdAt,
    required int tripId,
    required int userId,
    required String message,
    String? userNickname,
    String? userImg,
  }) = _ChatEntity;
}
