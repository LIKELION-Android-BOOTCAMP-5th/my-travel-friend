import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DI/injection.dart';
import '../../../../core/widget/toast_pop.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../viewmodels/alarm_setting_bloc.dart';
import '../viewmodels/alarm_setting_event.dart';
import '../viewmodels/alarm_setting_state.dart';
import 'alarm_setting_screen.dart';

// [이재은] 알림설정을 감싸는 위젯
class AlarmSettingBlocWidget extends StatelessWidget {
  const AlarmSettingBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProfileBloc>().state;

    if (user is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    final userId = user.userInfo.id!;

    return BlocProvider(
      create: (_) {
        final bloc = sl<AlarmSettingBloc>();
        bloc.add(AlarmSettingEvent.load(userId: userId));
        return bloc;
      },
      child: const _AlarmSettingBlocConsumer(),
    );
  }
}

class _AlarmSettingBlocConsumer extends StatelessWidget {
  const _AlarmSettingBlocConsumer();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlarmSettingBloc, AlarmSettingState>(
      listener: (context, state) {
        if (state.pageState == AlarmSettingPageState.error) {
          ToastPop.show(state.message ?? '오류가 발생했습니다');
        }
      },
      builder: (context, state) {
        return const AlarmSettingScreen();
      },
    );
  }
}
