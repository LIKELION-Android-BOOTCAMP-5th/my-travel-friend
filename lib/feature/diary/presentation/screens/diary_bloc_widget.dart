import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DI/injection.dart';
import '../../../../core/widget/toast_pop.dart';
import '../viewmodels/diary_bloc.dart';
import '../viewmodels/diary_event.dart';
import '../viewmodels/diary_page_state.dart';
import '../viewmodels/diary_state.dart';
import 'diary_list_screen.dart';

// [이재은] 다이어리 리스트를 감싸는 위젯
// -BlocProvider로 DiaryBloc 제공
// -BlocConsumer로 상태변화 감지

class DiaryBlocWidget extends StatelessWidget {
  final int tripId;
  final int userId; // 로그인한 아이디

  const DiaryBlocWidget({
    super.key,
    required this.tripId,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
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
        if (pageState is DiaryPageSuccess) {
          ToastPop.show(pageState.message ?? '완료되었습니다');
        }

        // 에러 상태: 토스트 표시
        if (pageState is DiaryPageError) {
          ToastPop.show(pageState.message);
        }

        // 상세 조회 성공: 팝업 띄우기
        if (pageState is DiaryPageDetailLoaded) {
          _showDiaryDetailPopUp(context, pageState.diary);
        }
      },

      builder: (context, state) {
        return state.pageState.when(
          initial: () => DiaryListScreen(tripId: tripId, userId: userId),
          loaded:
              (
                diaries,
                allDiaries,
                currentFilter,
                currentPage,
                hasMore,
                isLoadingMore,
              ) => DiaryListScreen(tripId: tripId, userId: userId),
          success: (message, actionType) =>
              DiaryListScreen(tripId: tripId, userId: userId),
          error: (message, errorType) =>
              DiaryListScreen(tripId: tripId, userId: userId),
          detailLoaded: (diary) =>
              DiaryListScreen(tripId: tripId, userId: userId),
          loading: () => Stack(
            children: [
              DiaryListScreen(tripId: tripId, userId: userId),
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        );
      },
    );
  }

  /// 다이어리 상세 팝업 표시
  void _showDiaryDetailPopUp(BuildContext context, dynamic diary) {
    // TODO: DiaryDetailPopUp 구현 후 연결
  }
}
