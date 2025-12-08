import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DI/injection.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../viewmodels/new_diary_bloc.dart';
import 'new_diary_screen.dart';

// [이재은] 다이어리 생성 화면을 감싸는 위젯
// - NewDiaryBloc 제공
// - 생성 성공 시 true 반환하여 호출한 쪽에서 목록 새로고침

class NewDiaryBlocWidget extends StatelessWidget {
  final int tripId;

  const NewDiaryBlocWidget({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProfileBloc>().state;

    if (user is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    final userId = user.userInfo.id!;
    return BlocProvider(
      create: (_) => sl<NewDiaryBloc>(),
      child: NewDiaryScreen(tripId: tripId, userId: userId),
    );
  }
}
