// [이재은] 테마 설정 화면
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
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (selectedTheme) => _buildThemeList(context, selectedTheme),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }

  Widget _buildThemeList(BuildContext context, AppThemeType selectedTheme) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        SizedBox(height: 16),
        // 테마 옵션 목록
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
                    theme: getThemeInfo(AppThemeType.light)!,
                    isSelected: selectedTheme == AppThemeType.light,
                    onTap: () => context.read<ThemeBloc>().add(
                      const UpdateTheme(AppThemeType.light),
                    ),
                  ),
                  // 다크 모드
                  _buildItem(
                    context: context,
                    theme: getThemeInfo(AppThemeType.dark)!,
                    isSelected: selectedTheme == AppThemeType.dark,
                    onTap: () => context.read<ThemeBloc>().add(
                      const UpdateTheme(AppThemeType.dark),
                    ),
                  ),
                  // 시스템 설정
                  _buildItem(
                    context: context,
                    theme: getThemeInfo(AppThemeType.system)!,
                    isSelected: selectedTheme == AppThemeType.system,
                    onTap: () => context.read<ThemeBloc>().add(
                      const UpdateTheme(AppThemeType.system),
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

  // 개별 아이템 + Divider(마지막이 아닐때만)
  Widget _buildItem({
    required BuildContext context,
    required ThemeInfo theme,
    required bool isSelected,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        ThemeBox(
          theme: theme,
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
