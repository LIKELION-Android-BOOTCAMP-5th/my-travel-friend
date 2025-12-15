import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as authState;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/DI/injection.dart';
import '../../../../../core/widget/toast_pop.dart';
import '../../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../../viewmodels/diary/diary_bloc.dart';
import '../../viewmodels/diary/diary_event.dart';
import '../../viewmodels/diary/diary_state.dart';
import '../../widgets/diary_detail_pop_up.dart';
import 'diary_list_screen.dart';

// [이재은] 다이어리 리스트를 감싸는 위젯
// -BlocProvider로 DiaryBloc 제공
// -BlocConsumer로 상태변화 감지

class DiaryBlocWidget extends StatelessWidget {
  final int tripId;

  const DiaryBlocWidget({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProfileBloc>().state;

    if (user is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    final userId = user.userInfo.id!;

    return BlocProvider(
      create: (_) {
        final bloc = sl<DiaryBloc>();
        bloc.add(DiaryEvent.getOurDiaries(tripId: tripId));
        return bloc;
      },
      child: _DiaryBlocConsumer(tripId: tripId, userId: userId),
    );
  }
}

class _DiaryBlocConsumer extends StatelessWidget {
  final int tripId;
  final int userId;

  const _DiaryBlocConsumer({required this.tripId, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiaryBloc, DiaryState>(
      listener: (context, state) {
        final pageState = state.pageState;

        // 성공 상태: 토스트 표시
        if (state.pageState == DiaryPageState.success) {
          ToastPop.show(state.message ?? '완료되었습니다');
        }

        // 에러 상태: 토스트 표시
        if (state.pageState == DiaryPageState.error) {
          ToastPop.show(state.message ?? '오류가 발생했습니다');
        }
      },

      builder: (context, state) {
        if (state.pageState == DiaryPageState.loading) {
          return Stack(
            children: [
              DiaryListScreen(tripId: tripId, userId: userId),
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }

        return DiaryListScreen(tripId: tripId, userId: userId);
      },
    );
  }

  // 다이어리 상세 팝업 표시
  void _showDiaryDetailPopUp(BuildContext context, dynamic diary) {
    showDialog(
      context: context,
      barrierDismissible: true, // 바깥 터치로 닫기
      barrierColor: Colors.black.withOpacity(0.5), // 배경 어둡게
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: DiaryDetailPopUp(diary: diary),
      ),
    ).then((_) {
      if (context.mounted) {
        context.read<DiaryBloc>().add(const DiaryEvent.clearSelectedDiary());
      }
    });
  }
}
