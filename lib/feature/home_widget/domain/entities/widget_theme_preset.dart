import 'package:flutter/material.dart';

// 위젯 테마 프리셋
enum WidgetThemePreset {
  // 기본
  defaultLight(
    name: '파랑포인트1',
    backgroundColor: 0xFFFFFFFF,
    backgroundOpacity: 1.0,
    textColor: 0xFF333333,
    accentColor: 0xFF6BB9E0,
  ),
  defaultDark(
    name: '파랑포인트2',
    backgroundColor: 0xFF1E1E1E,
    backgroundOpacity: 1.0,
    textColor: 0xFFEEEEEE,
    accentColor: 0xFF7CC5E8,
  ),

  transparentLight(
    name: '빨강포인트',
    backgroundColor: 0xFFFFFFFF,
    backgroundOpacity: 1.0,
    textColor: 0xFF333333,
    accentColor: 0xFFF27B7B,
  ),
  transparentDark(
    name: '노랑포인트',
    backgroundColor: 0xFF000000,
    backgroundOpacity: 1.0,
    textColor: 0xFFFFFFFF,
    accentColor: 0xFFF5C651,
  );

  const WidgetThemePreset({
    required this.name,
    required this.backgroundColor,
    required this.backgroundOpacity,
    required this.textColor,
    required this.accentColor,
  });

  final String name;
  final int backgroundColor;
  final double backgroundOpacity;
  final int textColor;
  final int accentColor;

  // 미리보기용 Color 객체들
  Color get bgColor => Color(backgroundColor).withOpacity(backgroundOpacity);
  Color get txtColor => Color(textColor);
  Color get actColor => Color(accentColor);
}
