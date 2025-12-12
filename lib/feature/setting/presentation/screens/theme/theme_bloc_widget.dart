import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../viewmodels/theme/theme_bloc.dart';
import 'theme_screen.dart';

// [이재은] 테마 설정 Bloc 위젯
class ThemeBlocWidget extends StatelessWidget {
  const ThemeBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 전역 BLoC 사용
    return BlocProvider.value(
      value: GetIt.instance<ThemeBloc>(),
      child: const ThemeScreen(),
    );
  }
}
