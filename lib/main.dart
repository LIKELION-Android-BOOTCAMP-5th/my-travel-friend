import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_travel_friend/config/router.dart';
import 'package:my_travel_friend/core/DI/injection.dart';
import 'package:my_travel_friend/feature/auth/presentation/screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //dotenv는di 등록이 안되므로 먼저 여기서 초기화
  await dotenv.load(fileName: "assets/config/.env");
  //DI관련
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.instance.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Pretendard'),
    );
  }
}
