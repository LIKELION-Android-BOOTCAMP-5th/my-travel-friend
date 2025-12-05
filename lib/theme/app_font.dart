import 'package:flutter/material.dart';

// [이재은] 앱 디자인에서 사용된 폰트 스타일을 파일화 함
class AppFont {
  static const String _fontFamily = 'Pretendard';

  // 스타일들
  // D1 : Pretendard semibold 24px
  static const TextStyle hugeBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24,
    height: 32 / 24,
  );

  // D2 : Pretendard medium 24px
  static const TextStyle huge = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 32 / 24,
  );

  // D3 : Pretendard medium 20px
  static const TextStyle big = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 28 / 20,
  );

  // D4 : Pretendard medium 18px
  static const TextStyle medium = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    height: 28 / 18,
  );

  // D5 : Pretendard medium 16px
  static const TextStyle regularBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 24 / 16,
  );

  // D6 : Pretendard regular 16px
  static const TextStyle regular = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
  );

  // D7 : Pretendard regular 14px
  static const TextStyle small = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
  );

  // D8 : Pretendard regular 12px
  static const TextStyle tiny = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
  );

  // D9 : Roboto Medium 12px
  static const TextStyle login = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w900,
    fontSize: 15,
    height: 19 / 15,
  );

  // [이재은] Material3 TextTheme으로 변환
  static TextTheme get textTheme => const TextTheme(
    displayLarge: tiny,
    displayMedium: small,
    displaySmall: regular,
    headlineLarge: regularBold,
    headlineMedium: medium,
    headlineSmall: big,
    titleLarge: huge,
    titleMedium: hugeBold,
    titleSmall: login,
  );
}
