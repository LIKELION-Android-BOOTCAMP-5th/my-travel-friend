import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/feature/setting/presentation/screens/profile_screen.dart';

import '../../../../core/DI/injection.dart';
import '../../../../core/widget/toast_pop.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_event.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../viewmodels/profile_bloc.dart';
import '../viewmodels/profile_event.dart';
import '../viewmodels/profile_state.dart';

// [이재은] 프로필 설정을 감싸는 위젯
class ProfileBlocWidget extends StatelessWidget {
  const ProfileBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthProfileBloc>().state;

    if (authState is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    final userInfo = authState.userInfo;

    return BlocProvider(
      create: (_) {
        final bloc = sl<ProfileBloc>();
        bloc.add(ProfileEvent.loadProfile(profile: userInfo));
        return bloc;
      },
      child: _ProfileBlocConsumer(),
    );
  }
}

class _ProfileBlocConsumer extends StatelessWidget {
  const _ProfileBlocConsumer();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listenWhen: (prev, curr) => prev.pageState != curr.pageState,
      listener: (context, state) {
        if (state.pageState == ProfilePageState.success) {
          // AuthProfileBloc 업데이트 (전역 상태 동기화)
          if (state.originalProfile != null) {
            context.read<AuthProfileBloc>().add(
              AuthProfileEvent.updateUserInfo(userInfo: state.originalProfile!),
            );
          }
          ToastPop.show(state.message ?? '프로필을 업데이트했습니다');

          Future.delayed(const Duration(milliseconds: 300), () {
            if (context.mounted) {
              context.pop(true);
            }
          });
        }

        if (state.pageState == ProfilePageState.error) {
          ToastPop.show(state.message ?? '오류가 발생했습니다');
        }
      },
      builder: (context, state) {
        if (state.originalProfile == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return ProfileScreen();
      },
    );
  }
}
