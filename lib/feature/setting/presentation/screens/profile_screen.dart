import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/widget/app_bar.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/profile_bloc.dart';
import 'package:my_travel_friend/feature/setting/presentation/widgets/profile_img_box.dart';

import '../../../../core/widget/button.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_icon.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../viewmodels/profile_state.dart';
import '../widgets/nickname_box.dart';

// [이재은] 프로필 설정 화면
class ProfileScreen extends StatelessWidget {
  final UserEntity profile;
  const ProfileScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

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
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.pageState == ProfilePageState.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.pageState == ProfilePageState.error) {
              return Center(child: Text(state.message ?? "오류가 발생했습니다"));
            }

            return _buildProfileList(context, state);
          },
        ),
      ),
    );
  }

  // 설정 화면
  Widget _buildProfileList(BuildContext context, ProfileState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

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
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
