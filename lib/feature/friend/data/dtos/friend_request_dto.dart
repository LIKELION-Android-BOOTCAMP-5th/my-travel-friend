import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/friend/domain/entities/friend_request_entity.dart';

part 'friend_request_dto.freezed.dart';
part 'friend_request_dto.g.dart';

@freezed
abstract class FriendRequestDTO with _$FriendRequestDTO {
  const FriendRequestDTO._();

  const factory FriendRequestDTO({
    int? id,
    @JsonKey(name: 'request_id') required int requestId,
    @JsonKey(name: 'target_id') required int targetId,
    @JsonKey(name: 'answered_at') String? answeredAt,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _FriendRequestDTO;

  factory FriendRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestDTOFromJson(json);

  FriendRequestEntity toEntity() {
    return FriendRequestEntity(
      id: id,
      requestId: requestId,
      targetId: targetId,
      answeredAt: answeredAt,
      createdAt: createdAt,
    );
  }
}
