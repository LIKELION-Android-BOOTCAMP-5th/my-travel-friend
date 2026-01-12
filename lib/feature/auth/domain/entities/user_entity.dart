import 'package:freezed_annotation/freezed_annotation.dart';
//freezed어노테이션 @ <= 이게 어노테이션입니다.
part 'user_entity.freezed.dart';

/*
반드시 추상 클래스로 생성
클래스위에 @freezed어노테이션 붙히기
with 뒤에는 _$클래스명
아래쪽 팩토리 뒤에는  = _클래스명
json직렬화를 위한 코드도 _$클래스명FromJson

모든 코드를 작성하더라도 오류가 뜰겁니다.
그때 콘솔창에 flutter pub run build_runner build 를 치시면.freezed 파일과 .g파일 생성되고 오류 없어집니다.

flutter 3.0이후부터는 반드시 클래스명 앞에 abstract나 sealed 키워드가 붙어야합니다 아니라면 _$MyClass 인터페이스를 수동으로 구현해야 합니다
*/
@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    int? id,
    String? uuid,
    String? nickname,
    String? email,
    String? token,
    String? profileImg,
    String? deletedAt,
  }) = _UserEntity;
}

enum SocialLoginType { google, kakao, apple, naver }
