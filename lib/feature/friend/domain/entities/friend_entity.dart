import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_entity.freezed.dart';

// [엄수빈] 프렌즈 엔티티 생성
@freezed
abstract class FriendEntity with _$FriendEntity {
  const factory FriendEntity({
    required String id, // 친구 관계 id
    String? user1Id, // 친구 1
    String? user2Id, // 친구 2
    DateTime? createdAt, // 친구가 된 시점
  }) = _FriendEntity;
}
