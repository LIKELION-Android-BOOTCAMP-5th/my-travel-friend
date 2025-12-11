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
      // sl<FriendBloc>() : DI 컨테이너에서 FriendBloc 꺼내오기
      create: (_) {
        final bloc = sl<FriendBloc>();
        // 화면 진입 시 친구 목록 조회 이벤트 한 번 쏴주기
        bloc.add(FriendEvent.getFriends(userId: userId));
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
      /// 상태 변화에 따른 부수효과(토스트, 팝업 등)를 처리
      listener: (context, state) {
        // 성공 상태: 토스트 표시
        if (state.pageState == FriendPageState.success) {
          ToastPop.show(state.message ?? '완료되었습니다');
        }

        // 에러 상태: 토스트 표시
        if (state.pageState == FriendPageState.error) {
          ToastPop.show(state.message ?? '오류가 발생했습니다');
        }

        // 만약 go_travel 액션일 때 화면 이동하고 싶으면 여기서 처리 가능
        // if (state.actionType == 'go_travel') { ... }
      },

      /// builder 는 실제 화면 그리기
      /// - 로딩일 때는 반투명 레이어 + 인디케이터를 위에 얹어서 보여줌
      builder: (context, state) {
        if (state.pageState == FriendPageState.loading) {
          return Stack(
            children: [
              FriendListScreen(userId: userId),
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }

        // 그 외 상태는 그냥 친구 리스트 화면만 보여줌
        return FriendListScreen(userId: userId);
      },
    );
  }
}
