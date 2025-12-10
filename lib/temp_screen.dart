import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_event.dart';
import 'package:my_travel_friend/theme/app_colors.dart';
import 'package:my_travel_friend/theme/app_icon.dart';

///TODO:해당 페이지는 임시 페이지입니다. 개발 시작하면 지울겁니다.
///라우팅 확인용 페이지
class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text("임시페이지"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => context.push('/login'),
                child: Text("로그인으로"),
              ),
              TextButton(
                onPressed: () => {
                  BlocProvider.of<AuthProfileBloc>(
                    context,
                  ).add(const AuthProfileEvent.signOut()),
                },
                child: Text("로그인아웃"),
              ),
            ],
          ),
          IconButton(
            onPressed: () => context.push('/diary'),
            icon: Icon(AppIcon.diary, color: AppColors.lightGreen, size: 30),
          ),
          IconButton(
            onPressed: () => context.push('/mainHome'),
            icon: Icon(AppIcon.home, color: AppColors.lightGreen, size: 30),
          ),
          IconButton(
            onPressed: () => context.push('/alarm'),
            icon: Icon(AppIcon.alarm, color: AppColors.lightGreen, size: 30),
          ),
          IconButton(
            onPressed: () => context.push('/alarmSetting'),
            icon: Icon(AppIcon.setting, color: AppColors.lightGreen, size: 30),
          ),
          IconButton(
            onPressed: () => context.push('/checklist'),
            icon: Icon(
              AppIcon.checklist,
              color: AppColors.lightGreen,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () => context.push('/profile'),
            icon: Icon(AppIcon.crews, color: AppColors.lightGreen, size: 30),
          ),
        ],
      ),
    );
  }
}
