import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router.dart';
import '../../viewmodels/theme/theme_bloc.dart';
import '../../viewmodels/theme/theme_event.dart';
import 'theme_screen.dart';

// [이재은] 테마 설정 Bloc 위젯
class ThemeBlocWidget extends StatelessWidget {
  const ThemeBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ThemeBloc>()..add(const LoadTheme()),
      child: const ThemeScreen(),
    );
  }
}
