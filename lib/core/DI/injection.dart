import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/DI/injection.config.dart';

final GetIt sl = GetIt.instance; // sl: Service Locator의 약자 (관례)

// GetIt을 초기화하고 의존성을 등록하는 함수입니다.
// @InjectableInit 어노테이션이 injectable_generator에게
// 이 파일을 기준으로 DI 설정을 하라고 지시합니다.
@InjectableInit(
  initializerName: 'init', // 기본값: init
  preferRelativeImports: true, // 상대 경로 import 선호
  asExtension: true, // GetIt을 확장 함수로 사용
)
Future<void> configureDependencies() async {
  // Hot Restart 시 중복 등록 에러 방지
  sl.allowReassignment = true;
  await sl.init();
}
