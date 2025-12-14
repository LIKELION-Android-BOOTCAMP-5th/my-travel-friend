import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/friend/presentation/screen/recevice_list_screen.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_event.dart';

import '../../../../core/DI/injection.dart';
import '../../../../core/widget/toast_pop.dart';
import '../viewmodel/friend_request_bloc.dart';
import '../viewmodel/friend_request_state.dart';
import '../viewmodel/friend_state.dart';

/// [엄수빈] 받은 친구요청을 감싸는 위젯
class ReceviceListBlocWidget extends StatelessWidget {
  final int userId; // 현재 로그인한 사용자 ID

  const ReceviceListBlocWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = sl<FriendRequestBloc>();
        // 화면 진입 시 친구 목록 조회 이벤트 한 번 쏴주기
<<<<<<<< Updated upstream:lib/feature/friend/presentation/screen/recevice_list_bloc_widget.dart
        bloc.add(FriendRequestEvent.getRequestProfile(myId: userId));
        bloc.add(FriendRequestEvent.getFriendRequest(userId: userId));
========
        bloc.add(FriendEvent.getFriendUsers(myId: userId));
>>>>>>>> Stashed changes:lib/feature/friend/presentation/screen/friend_bloc_widget.dart
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
<<<<<<<< Updated upstream:lib/feature/friend/presentation/screen/recevice_list_bloc_widget.dart
    return BlocConsumer<FriendRequestBloc, FriendRequestState>(
========
    return BlocConsumer<FriendBloc, FriendState>(
>>>>>>>> Stashed changes:lib/feature/friend/presentation/screen/friend_bloc_widget.dart
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
<<<<<<<< Updated upstream:lib/feature/friend/presentation/screen/recevice_list_bloc_widget.dart
        final screen = ReceviceListScreen(userId: userId);

        // 로딩 상태
        if (state.pageState == FriendRequestPageState.loading) {
========
        final screen = FriendListScreen(userId: userId);

        // 로딩 상태
        if (state.pageState == FriendPageState.loading) {
>>>>>>>> Stashed changes:lib/feature/friend/presentation/screen/friend_bloc_widget.dart
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
