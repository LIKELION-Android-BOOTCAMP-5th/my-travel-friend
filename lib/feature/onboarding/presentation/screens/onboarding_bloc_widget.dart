import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../viewmodels/onboarding_bloc.dart';
import 'onboarding_screen.dart';

/// 온보딩 BLoC Provider Widget
///
/// GetIt에서 OnboardingBloc을 주입받아 OnboardingScreen에 제공
class OnboardingBlocWidget extends StatelessWidget {
  const OnboardingBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<OnboardingBloc>(),
      child: OnboardingScreen(),
    );
  }
}
