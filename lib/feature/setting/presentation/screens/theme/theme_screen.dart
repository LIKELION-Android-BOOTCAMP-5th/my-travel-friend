import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icon.dart';
import '../../../../../core/widget/app_bar.dart';
import '../../../../../core/widget/button.dart';
import '../../viewmodels/theme/theme_bloc.dart';
import '../../viewmodels/theme/theme_event.dart';
import '../../viewmodels/theme/theme_state.dart';
import '../../widgets/theme_box.dart';

// [이재은] 테마 설정 화면
class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
      appBar: CustomButtonAppBar(
        title: '테마 설정',
        leading: Button(
          width: 40,
          height: 40,
          icon: Icon(AppIcon.back),
          contentColor: isDark ? colorScheme.onSurface : AppColors.light,
          borderRadius: 20,
          onTap: () => context.pop(),
        ),
      ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return _buildThemeList(context, state);
        },
      ),
    );
  }

  Widget _buildThemeList(BuildContext context, ThemeState currentState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 라이트 모드
                  _buildItem(
                    context: context,
                    state: const ThemeState.light(),
                    isSelected: currentState is ThemeLight,
                    onTap: () => context.read<ThemeBloc>().add(
                      const UpdateTheme(ThemeState.light()),
                    ),
                  ),
                  // 다크 모드
                  _buildItem(
                    context: context,
                    state: const ThemeState.dark(),
                    isSelected: currentState is ThemeDark,
                    onTap: () => context.read<ThemeBloc>().add(
                      const UpdateTheme(ThemeState.dark()),
                    ),
                  ),
                  // 시스템 설정
                  _buildItem(
                    context: context,
                    state: const ThemeState.system(),
                    isSelected: currentState is ThemeSystem,
                    onTap: () => context.read<ThemeBloc>().add(
                      const UpdateTheme(ThemeState.system()),
                    ),
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required ThemeState state,
    required bool isSelected,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeInfo = getThemeInfo(state);

    if (themeInfo == null) return const SizedBox.shrink();

    return Column(
      children: [
        ThemeBox(
          state: state,
          themeInfo: themeInfo,
          isSelected: isSelected,
          onTap: onTap,
          isLast: isLast,
        ),
        if (!isLast)
          Divider(
            height: 0.5,
            color: colorScheme.outlineVariant.withOpacity(0.3),
          ),
      ],
    );
  }
}
