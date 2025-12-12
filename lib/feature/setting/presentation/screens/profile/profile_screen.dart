import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/widget/app_bar.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/profile/profile_bloc.dart';
import 'package:my_travel_friend/feature/setting/presentation/widgets/profile/profile_img_box.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icon.dart';
import '../../../../../core/widget/button.dart';
import '../../../../../core/widget/toast_pop.dart';
import '../../viewmodels/profile/profile_event.dart';
import '../../viewmodels/profile/profile_state.dart';
import '../../widgets/profile/delete_profile_button.dart';
import '../../widgets/profile/email_box.dart';
import '../../widgets/profile/nickname_box.dart';

// [이재은] 프로필 설정 화면
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.pageState == ProfilePageState.success) {
          ToastPop.show('프로필이 저장되었어요');

          Future.delayed(const Duration(milliseconds: 500), () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/setting');
            }
          });
        } else if (state.pageState == ProfilePageState.error) {
          ToastPop.show(state.message ?? '저장에 실패했어요');
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          final isSaving = state.pageState == ProfilePageState.saving;
          final canSave = state.canSave;

          return Scaffold(
            backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
            appBar: CustomButtonAppBar(
              title: '프로필 설정',
              leading: Button(
                width: 40,
                height: 40,
                icon: Icon(AppIcon.back),
                contentColor: isDark ? colorScheme.onSurface : AppColors.light,
                borderRadius: 20,
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/setting'); // 스택 없으면 설정으로
                  }
                },
              ),
              actions: [
                Button(
                  width: 40,
                  height: 40,
                  icon: isSaving || state.isUploading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: isDark
                                ? colorScheme.onSurface
                                : AppColors.light,
                          ),
                        )
                      : AppIcon.save,
                  contentColor: isDark
                      ? colorScheme.onSurface
                      : AppColors.light,
                  borderRadius: 20,
                  onTap: canSave && !isSaving && !state.isUploading
                      ? () {
                          context.read<ProfileBloc>().add(
                            const ProfileEvent.updateProfile(),
                          );
                        }
                      : null,
                ),
              ],
            ),
            body: SafeArea(child: _buildProfileList(context, state)),
          );
        },
      ),
    );
  }

  // 설정 화면
  Widget _buildProfileList(BuildContext context, ProfileState state) {
    final colorScheme = Theme.of(context).colorScheme;

    if (state.pageState == ProfilePageState.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileImgBox(),
            SizedBox(height: 16),
            NicknameBox(),
            SizedBox(height: 16),
            EmailBox(),
            SizedBox(height: 16),
            DeleteProfileButton(),
          ],
        ),
      ),
    );
  }
}
