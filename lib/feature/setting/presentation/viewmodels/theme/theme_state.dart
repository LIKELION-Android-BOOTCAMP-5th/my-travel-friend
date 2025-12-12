import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

// [이재은] 테마 설정 관련 상태

// 테마 정보
class ThemeInfo {
  final String title;
  final String description;

  const ThemeInfo({required this.title, required this.description});
}

// 테마 옵션 목록
const Map<Type, ThemeInfo> themeOptionsMap = {
  ThemeLight: ThemeInfo(title: '라이트 모드', description: '밝은 테마로 표시됩니다'),
  ThemeDark: ThemeInfo(title: '다크 모드', description: '어두운 테마로 표시됩니다'),
  ThemeSystem: ThemeInfo(title: '시스템 설정', description: '기기 설정을 따릅니다'),
};

@freezed
abstract class ThemeState with _$ThemeState {
  const ThemeState._();

  const factory ThemeState.light() = ThemeLight;
  const factory ThemeState.dark() = ThemeDark;
  const factory ThemeState.system() = ThemeSystem;
}

// 테마 정보 가져오기
ThemeInfo? getThemeInfo(ThemeState state) => themeOptionsMap[state.runtimeType];
