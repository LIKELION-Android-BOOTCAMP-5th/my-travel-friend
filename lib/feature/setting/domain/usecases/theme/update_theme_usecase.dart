import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/core/service/internal/theme_service.dart';

// [이재은] 테마 변경 usecase
@LazySingleton()
class UpdateThemeUseCase {
  final ThemeService _themeService;

  UpdateThemeUseCase(this._themeService);

  Future<Result<void>> call(AppThemeType type) async {
    try {
      await _themeService.updateTheme(type);
      return Result.success(null);
    } catch (e) {
      return Result.failure(Failure.undefined(message: '테마 변경에 실패했어요'));
    }
  }
}
