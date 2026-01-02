import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/setting/presentation/screens/home_widget/widget_settings_screen.dart';

import '../../../../../core/DI/injection.dart';
import '../../../../../core/widget/toast_pop.dart';
import '../../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../../viewmodels/home_widget/widget_setting_bloc.dart';
import '../../viewmodels/home_widget/widget_setting_event.dart';
import '../../viewmodels/home_widget/widget_setting_state.dart';

class WidgetSettingsBlocWidget extends StatelessWidget {
  const WidgetSettingsBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthProfileBloc>().state;

    if (authState is! AuthProfileAuthenticated) {
      return const Scaffold(body: Center(child: Text('로그인이 필요합니다')));
    }

    final userId = authState.userInfo.id!;

    return BlocProvider(
      create: (_) =>
          sl<WidgetSettingsBloc>()
            ..add(WidgetSettingsEvent.loadSetting(userId: userId)),
      child: const _WidgetSettingsBlocConsumer(),
    );
  }
}

class _WidgetSettingsBlocConsumer extends StatelessWidget {
  const _WidgetSettingsBlocConsumer();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WidgetSettingsBloc, WidgetSettingsState>(
      listener: (context, state) {
        if (state.saveSuccess) {
          ToastPop.show('위젯 설정이 저장되었습니다');
        }
        if (state.errorMessage != null) {
          ToastPop.show(state.errorMessage!);
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return Scaffold(
            appBar: AppBar(title: const Text('위젯 설정')),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        return const WidgetSettingsScreen();
      },
    );
  }
}
