import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/friend_entity.dart';

part 'friend_dto.freezed.dart';
part 'friend_dto.g.dart';

// [엄수빈] 친구 DTO
@freezed
abstract class FriendDTO with _$FriendDTO {
  const FriendDTO._();

  const factory FriendDTO({
    int? id,
    @JsonKey(name: 'user1_id') int? userId1,
    @JsonKey(name: 'user2_id') int? userId2,
    @JsonKey(name: 'create_at') String? createdAt,
  }) = _FriendDTO;

  factory FriendDTO.fromJson(Map<String, dynamic> json) =>
      _$FriendDTOFromJson(json);

  FriendEntity toEntity() {
    return FriendEntity(
      id: id,
      userId1: userId1,
      userId2: userId2,
      createdAt: createdAt,
    );
  }
}
