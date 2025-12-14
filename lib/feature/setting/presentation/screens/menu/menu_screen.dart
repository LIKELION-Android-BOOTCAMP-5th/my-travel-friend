import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';
import 'package:my_travel_friend/core/theme/app_font.dart';
import 'package:my_travel_friend/core/widget/app_bar.dart';
import 'package:my_travel_friend/feature/setting/presentation/widgets/menu/menu_box.dart';

import '../../../../../core/theme/app_icon.dart';
import '../../../../../core/util/launcher.dart';
import '../../../../../core/widget/button.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../../auth/presentation/viewmodel/auth_profile/auth_profile_event.dart';
import '../../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../../viewmodels/menu/menu_bloc.dart';
import '../../viewmodels/menu/menu_state.dart';
import '../../widgets/menu/profile_button.dart';

// [이재은] 설정 메뉴 화면
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
      appBar: CustomButtonAppBar(
        title: '설정',
        leading: Button(
          width: 40,
          height: 40,
          icon: Icon(AppIcon.back),
          contentColor: isDark ? colorScheme.onSurface : AppColors.light,
          borderRadius: 20,
          onTap: () => context.pop(),
        ),
      ),
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state.pageState == MenuPageState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          final user = context.read<AuthProfileBloc>().state;

          if (user is! AuthProfileAuthenticated) {
            return const Center(child: Text("로그인이 필요합니다"));
          }

          final userProfile = user.userInfo;

          return _buildMenuScreen(context, userProfile, state);
        },
      ),
    );
  }

  // 설정 메뉴 화면
  Widget _buildMenuScreen(
    BuildContext context,
    UserEntity? user,
    MenuState state,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8),
            ProfileButton(profile: user!),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "친구",
                          style: AppFont.medium.copyWith(
                            color: isDark ? AppColors.light : AppColors.dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildFriendBlock(context: context, state: state),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "앱 설정",
                          style: AppFont.medium.copyWith(
                            color: isDark ? AppColors.light : AppColors.dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildSettingBlock(context: context, state: state),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "지원",
                          style: AppFont.medium.copyWith(
                            color: isDark ? AppColors.light : AppColors.dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildSupportBlock(context: context, state: state),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendBlock({
    required BuildContext context,
    required MenuState state,
    bool isLast = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;
    final user = context.read<AuthProfileBloc>().state;

    if (user is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    final userProfile = user.userInfo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenuBox(
                    state: state,
                    title: "친구 목록 보기",
                    onTap: () {
                      context.push(
                        '/setting/friend',
                        extra: {'userId': userProfile.id},
                      );
                    },
                  ),
                  Divider(
                    height: 0.5,
                    color: colorScheme.outlineVariant.withOpacity(0.3),
                  ),
                  MenuBox(
                    state: state,
                    title: "내가 받은 친구 요청",
                    onTap: () {
                      context.push(
                        '/setting/friend_recevice',
                        extra: {'userId': userProfile.id},
                      );
                    },
                  ),
                  Divider(
                    height: 0.5,
                    color: colorScheme.outlineVariant.withOpacity(0.3),
                  ),
                  MenuBox(state: state, title: "내가 받은 여행 초대", onTap: () {}),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingBlock({
    required BuildContext context,
    required MenuState state,
    bool isLast = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenuBox(
                    state: state,
                    title: "푸시 알림 설정",
                    onTap: () {
                      context.push('/setting/alarm');
                    },
                  ),
                  Divider(
                    height: 0.5,
                    color: colorScheme.outlineVariant.withOpacity(0.3),
                  ),
                  MenuBox(
                    state: state,
                    title: "테마 설정",
                    onTap: () {
                      context.push('/setting/theme');
                    },
                  ),
                  Divider(
                    height: 0.5,
                    color: colorScheme.outlineVariant.withOpacity(0.3),
                  ),
                  MenuBox(
                    state: state,
                    title: "권한 설정",
                    onTap: () {
                      context.push('/setting/permission');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSupportBlock({
    required BuildContext context,
    required MenuState state,
    bool isLast = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenuBox(
                    state: state,
                    title: "문의하기",
                    onTap: () {
                      Launcher.sendEmail(
                        email: '1113.mytravelfriend@gmail.com',
                        subject: '나의 여행 친구 문의',
                      );
                    },
                  ),
                  Divider(
                    height: 0.5,
                    color: colorScheme.outlineVariant.withOpacity(0.3),
                  ),
                  MenuBox(
                    state: state,
                    title: "로그아웃",
                    onTap: () {
                      BlocProvider.of<AuthProfileBloc>(
                        context,
                      ).add(const AuthProfileEvent.signOut());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
