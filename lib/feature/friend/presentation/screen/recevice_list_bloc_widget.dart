import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/friend/presentation/screen/recevice_list_screen.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_event.dart';

import '../../../../core/DI/injection.dart';
import '../../../../core/widget/toast_pop.dart';
import '../viewmodel/friend_bloc.dart';
import '../viewmodel/friend_event.dart';
import '../viewmodel/friend_request_bloc.dart';
import '../viewmodel/friend_request_state.dart';

/// [엄수빈] 받은 친구요청을 감싸는 위젯
class ReceviceListBlocWidget extends StatelessWidget {
  final int userId;

  const ReceviceListBlocWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final bloc = sl<FriendRequestBloc>();
            bloc.add(FriendRequestEvent.getRequestProfile(myId: userId));
            bloc.add(FriendRequestEvent.getFriendRequest(userId: userId));
            return bloc;
          },
        ),
        BlocProvider(
          create: (_) {
            final bloc = sl<FriendBloc>();
            return bloc;
          },
        ),
      ],
      child: BlocConsumer<FriendRequestBloc, FriendRequestState>(
        listenWhen: (p, c) =>
            p.pageState != c.pageState &&
            (c.actionType == 'accept' || c.actionType == 'delete'),
        listener: (context, state) {
          if (state.pageState == FriendRequestPageState.success) {
            ToastPop.show(
              state.actionType == 'accept' ? '수락하였습니다!' : '거절하였습니다!',
            );

            context.read<FriendRequestBloc>().add(
              FriendRequestEvent.getFriendRequest(userId: userId),
            );
            context.read<FriendRequestBloc>().add(
              FriendRequestEvent.getRequestProfile(myId: userId),
            );
          }

          if (state.pageState == FriendRequestPageState.error) {
            ToastPop.show(state.message ?? '오류가 발생했습니다');
          }
        },
        builder: (context, state) {
          final screen = ReceviceListScreen(
            userId: userId,
            state: state,

            onAccept: (requestRowId, requestId) {
              context.read<FriendRequestBloc>().add(
                FriendRequestEvent.acceptRequest(id: requestRowId),
              );
              context.read<FriendBloc>().add(
                FriendEvent.createFriendRelation(
                  userId1: requestId,
                  userId2: userId,
                ),
              );
            },

            onDelete: (requestRowId) {
              context.read<FriendRequestBloc>().add(
                FriendRequestEvent.deleteRequest(id: requestRowId),
              );
            },
          );

          if (state.pageState == FriendRequestPageState.loading) {
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
      ),
    );
  }
}
