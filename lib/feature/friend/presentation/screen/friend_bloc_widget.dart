import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_state.dart';

import '../../../../core/DI/injection.dart';
import '../../../../core/widget/toast_pop.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../viewmodel/friend_bloc.dart';
import '../viewmodel/friend_event.dart';
import 'friend_list_screen.dart';

class FriendBlocWidget extends StatelessWidget {
  final userId;
  const FriendBlocWidget({super.key, this.userId});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProfileBloc>().state;

    if (user is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    final userId = user.userInfo.id!;

    return BlocProvider(
      create: (_) {
        final bloc = sl<FriendBloc>();
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
      listener: (context, state) {
        final pageState = state.pageState;

        // 성공 상태: 토스트 표시
        if (state.pageState == FriendPageState.success) {
          ToastPop.show(state.message ?? '완료되었습니다');
        }

        // 에러 상태: 토스트 표시
        if (state.pageState == FriendPageState.error) {
          ToastPop.show(state.message ?? '오류가 발생했습니다');
        }
      },

      builder: (context, state) {
        if (state.pageState == FriendPageState.loading) {
          return Stack(
            children: [
              FriendListScreen(),
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }

        return FriendListScreen();
      },
    );
  }
}
