import 'package:flutter/material.dart';

//[엄수빈] 프로필 원형 이미지 컴포넌트
class ProfileImg extends StatelessWidget {
  final String? imageUrl;
  final double radius;

  const ProfileImg({super.key, this.imageUrl, this.radius = 40});

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;
    final defaultImage = 'assets/images/profile_hearty.png';

    return CircleAvatar(
      radius: radius,
      backgroundImage: hasImage
          ? NetworkImage(imageUrl!)
          : AssetImage(defaultImage),
    );
  }
}
