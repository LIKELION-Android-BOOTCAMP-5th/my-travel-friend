import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';

import '../../../../core/widget/toast_pop.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../viewmodels/alarm_bloc.dart';
import '../viewmodels/alarm_state.dart';
import 'alarm_list_screen.dart';

// [이재은] 알림 리스트를 감싸는 위젯
// - BlocProvider로 AlarmBloc 제공
// - BlocConsumer로 상태 변화 감지

class AlarmBlocWidget extends StatelessWidget {
  const AlarmBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProfileBloc>().state;

    if (user is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    final userId = user.userInfo.id!;

    return _AlarmBlocConsumer(userId: userId);
  }
}

class _AlarmBlocConsumer extends StatelessWidget {
  final int userId;

  const _AlarmBlocConsumer({required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlarmBloc, AlarmState>(
      listener: (context, state) {
        final pageState = state.pageState;

        // 성공 상태: 토스트 표시
        if (state.pageState == AlarmPageState.success) {
          ToastPop.show(state.message ?? '완료되었습니다');
        }

        // 에러 상태: 토스트 표시
        if (state.pageState == AlarmPageState.error) {
          ToastPop.show(state.message ?? '오류가 발생했습니다');
        }
      },

      builder: (context, state) {
        if (state.pageState == AlarmPageState.loading) {
          return Stack(
            children: [
              AlarmListScreen(userId: userId),
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }

        return AlarmListScreen(userId: userId);
      },
    );
  }
}
