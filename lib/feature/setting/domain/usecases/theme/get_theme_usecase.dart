import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/failures.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/core/service/internal/theme_service.dart';

// [이재은] 현재 테마 조회 usecase
@LazySingleton()
class GetThemeUseCase {
  final ThemeService _themeService;

  GetThemeUseCase(this._themeService);

  Future<Result<AppThemeType>> call() async {
    try {
      final theme = await _themeService.getTheme();
      return Result.success(theme);
    } catch (e) {
      return Result.failure(Failure.undefined(message: '테마를 불러오는데 실패했어요'));
    }
  }
}
