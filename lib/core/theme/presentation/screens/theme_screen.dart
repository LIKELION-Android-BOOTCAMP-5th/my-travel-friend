import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widget/app_bar.dart';
import '../../../../../core/widget/button.dart';
import '../../../../../theme/app_colors.dart';
import '../../../../../theme/app_icon.dart';
import '../viewmodels/theme_bloc.dart';
import '../viewmodels/theme_event.dart';
import '../viewmodels/theme_state.dart';
import '../widgets/theme_box.dart';

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
          if (state.pageState == ThemePageState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.pageState == ThemePageState.error) {
            return Center(child: Text(state.message ?? '오류가 발생했습니다'));
          }

          return _buildThemeList(context, state);
        },
      ),
    );
  }

  Widget _buildThemeList(BuildContext context, ThemeState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeOptions = state.themeOptions;

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
                  if (state.getThemeInfo(AppThemeType.light) != null)
                    _buildItem(
                      context: context,
                      theme: state.getThemeInfo(AppThemeType.light)!,
                      isSelected: state.selectedTheme == AppThemeType.light,
                      onTap: () => context.read<ThemeBloc>().add(
                        const UpdateTheme(AppThemeType.light),
                      ),
                    ),
                  // 다크 모드
                  if (state.getThemeInfo(AppThemeType.dark) != null)
                    _buildItem(
                      context: context,
                      theme: state.getThemeInfo(AppThemeType.dark)!,
                      isSelected: state.selectedTheme == AppThemeType.dark,
                      onTap: () => context.read<ThemeBloc>().add(
                        const UpdateTheme(AppThemeType.dark),
                      ),
                    ),
                  // 시스템 설정
                  if (state.getThemeInfo(AppThemeType.system) != null)
                    _buildItem(
                      context: context,
                      theme: state.getThemeInfo(AppThemeType.system)!,
                      isSelected: state.selectedTheme == AppThemeType.system,
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
        Expanded(child: Column(children: [SizedBox(width: 3)])),
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
