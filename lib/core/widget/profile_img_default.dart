import 'dart:math';

//[엄수빈] 프로필 기본이미지 랜덤 설정
class ProfileImgDefault {
  static final List<String> images = [
    'assets/images/profile_airplane.png',
    'assets/images/profile_bag.png',
    'assets/images/profile_hearty.png',
  ];

  static String random() {
    final random = Random();
    return images[random.nextInt(images.length)];
  }
}
