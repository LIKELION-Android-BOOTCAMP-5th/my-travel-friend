import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserDTO with _$UserDTO {
  const UserDTO._();

  const factory UserDTO({
    required int? id,
    required String? uuid,
    required String? nickname,
    required String? email,
    required String? token,
    @JsonKey(name: 'profile_img') required String? profileImg,
    @JsonKey(name: 'delete_at') required String? deletedAt,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      uuid: uuid,
      nickname: nickname,
      email: email,
      token: token,
      profileImg: profileImg,
      deletedAt: deletedAt,
    );
  }
}
