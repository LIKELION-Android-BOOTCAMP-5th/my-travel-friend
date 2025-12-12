import 'dart:io';

import 'package:flutter/material.dart';

//[엄수빈] 프로필 원형 이미지 컴포넌트
class ProfileImg extends StatelessWidget {
  final String? imageUrl;
  final File? imageFile; // 추가
  final double radius;

  const ProfileImg({
    super.key,
    this.imageUrl,
    this.imageFile, // 추가
    this.radius = 40,
  });

  @override
  Widget build(BuildContext context) {
    final defaultImage = 'assets/images/profile_hearty.png';

    // 로컬 파일 우선
    if (imageFile != null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: FileImage(imageFile!),
      );
    }

    // 서버 URL
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;
    return CircleAvatar(
      radius: radius,
      backgroundImage: hasImage
          ? NetworkImage(imageUrl!)
          : AssetImage(defaultImage),
    );
  }
}
