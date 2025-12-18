import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_event.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/profile/profile_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font.dart';
import '../../../../../core/theme/app_icon.dart';
import '../../../../../core/widget/pop_up_box.dart';

// [이재은] 탈퇴 버튼
class DeleteProfileButton extends StatelessWidget {
  const DeleteProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;
    //final profileBloc = context.read<ProfileBloc>();
    final authProfileBloc = BlocProvider.of<AuthProfileBloc>(context);

    return GestureDetector(
      onTap: () {
        _showDeletePopUp(context, authProfileBloc);
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: colorScheme.secondary.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 16, 12),
                      child: Center(
                        child: Icon(
                          AppIcon.removeUser,
                          color: colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "계정 삭제",
                    style: AppFont.regularBold.copyWith(
                      color: isDark ? AppColors.light : AppColors.dark,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "모든 여행 데이터와 정보가 영구적으로 삭제됩니다",
                    style: AppFont.small.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 삭제 확인 팝업
  void _showDeletePopUp(BuildContext context, AuthProfileBloc authProfileBloc) {
    final colorScheme = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (_) => PopUpBox(
        title: '계정을 삭제하시겠습니까?',
        message: '계정을 삭제하면 여행 정보, 친구, 사진 등 모든 데이터가 영구적으로 삭제되며 복구할 수 없습니다',
        icon: AppIcon.removeUser,
        iconColor: colorScheme.secondary,
        leftText: '취소',
        rightText: '삭제하기',
        rightButtonColor: colorScheme.secondary,
        rightTextColor: colorScheme.onSecondary,
        onRight: () {
          authProfileBloc.add(AuthProfileEvent.deleteUser());
        },
      ),
    );
  }
}
