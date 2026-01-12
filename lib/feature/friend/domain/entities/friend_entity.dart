import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_entity.freezed.dart';

// [엄수빈] 친구 엔티티 생성
@freezed
abstract class FriendEntity with _$FriendEntity {
  const factory FriendEntity({
    required int? id, // 친구 관계 id
    int? userId1, // 친구 1
    int? userId2, // 친구 2
    String? createdAt, // 친구가 된 시점
  }) = _FriendEntity;
}
