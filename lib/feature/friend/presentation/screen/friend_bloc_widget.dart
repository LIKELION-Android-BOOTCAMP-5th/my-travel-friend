import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DI/injection.dart';
import '../../../../core/widget/toast_pop.dart';
import '../viewmodel/friend_bloc.dart';
import '../viewmodel/friend_event.dart';
import '../viewmodel/friend_state.dart';
import 'friend_list_screen.dart';

/// [엄수빈] 친구 리스트를 감싸는 위젯
class FriendBlocWidget extends StatelessWidget {
  final int userId; // 현재 로그인한 사용자 ID

  const FriendBlocWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = sl<FriendBloc>();
        // 화면 진입 시 친구 목록 조회 이벤트 한 번 쏴주기
        bloc.add(FriendEvent.getFriendUsers(myId: userId));
        return bloc;
      },
      child: _FriendBlocConsumer(userId: userId),
    );
  }
}

class _FriendBlocConsumer extends StatelessWidget {
  final int userId;

  const _FriendBlocConsumer({required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FriendBloc, FriendState>(
      listener: (context, state) {
        // 성공 상태
        if (state.pageState == FriendPageState.success) {
          ToastPop.show(state.message ?? '완료되었습니다');
        }

        // 에러 상태
        if (state.pageState == FriendPageState.error) {
          ToastPop.show(state.message ?? '오류가 발생했습니다');
        }
      },

      builder: (context, state) {
        final screen = FriendListScreen(userId: userId);

        // 로딩 상태
        if (state.pageState == FriendPageState.loading) {
          return Stack(
            children: [
              screen,
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }

        return screen;
      },
    );
  }
}
