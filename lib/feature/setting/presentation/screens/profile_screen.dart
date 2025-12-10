import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/widget/app_bar.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/profile_bloc.dart';
import 'package:my_travel_friend/feature/setting/presentation/widgets/delete_profile_button.dart';
import 'package:my_travel_friend/feature/setting/presentation/widgets/profile_img_box.dart';

import '../../../../core/widget/button.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_icon.dart';
import '../viewmodels/profile_event.dart';
import '../viewmodels/profile_state.dart';
import '../widgets/email_box.dart';
import '../widgets/nickname_box.dart';

// [이재은] 프로필 설정 화면
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final isSaving = state.pageState == ProfilePageState.saving;
        final canSave = state.canSave;

        return SafeArea(
          child: Scaffold(
            backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
            appBar: CustomButtonAppBar(
              title: '프로필 설정',
              leading: Button(
                width: 40,
                height: 40,
                icon: Icon(AppIcon.back),
                contentColor: isDark ? colorScheme.onSurface : AppColors.light,
                borderRadius: 20,
                onTap: () => context.pop(),
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
            body: _buildProfileList(context, state),
          ),
        );
      },
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
