import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_bloc.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_event.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_state.dart';

import '../../../../core/DI/injection.dart';
import 'friend_request_screen.dart';

class FriendRequestBlocWidget extends StatelessWidget {
  final int requestId;

  const FriendRequestBlocWidget({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<FriendRequestBloc>(),
      child: BlocListener<FriendRequestBloc, FriendRequestState>(
        listenWhen: (prev, curr) =>
            prev.pageState != curr.pageState &&
            curr.actionType == 'request_create',
        listener: (context, state) {
          if (state.pageState == FriendRequestPageState.success) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('친구 요청을 보냈어요')));
          }
          if (state.pageState == FriendRequestPageState.error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message ?? '요청 실패')));
          }
        },
        child: BlocBuilder<FriendRequestBloc, FriendRequestState>(
          builder: (context, state) {
            return FriendRequestScreen(
              requestId: requestId,

              state: state,

              onSearchChanged: (keyword) {
                context.read<FriendRequestBloc>().add(
                  FriendRequestEvent.searchRequestName(
                    myId: requestId,
                    keyword: keyword,
                  ),
                );
              },
              onRequestCreate: (targetId) {
                context.read<FriendRequestBloc>().add(
                  FriendRequestEvent.requestCreate(
                    requestId: requestId,
                    targetId: targetId,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
