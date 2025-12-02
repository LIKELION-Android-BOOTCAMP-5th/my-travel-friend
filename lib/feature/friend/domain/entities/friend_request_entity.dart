import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_request_entity.freezed.dart';

// [엄수빈] 친구 요청 엔티티 생성
@freezed
abstract class FriendRequestEntity with _$FriendRequestEntity {
  const factory FriendRequestEntity({
    int? id, // 친구 관계 id
    required int requestId, // 요청한 친구
    required int targetId, // 받은 친구
    String? answeredAt, // 친구 수락 시점
    String? createdAt, // 친구 요청한 시점
  }) = _FriendRequestEntity;
}
