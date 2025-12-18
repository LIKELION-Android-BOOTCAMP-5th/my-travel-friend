import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DI/injection.dart';
import '../../../../core/widget/toast_pop.dart';
import '../../../trip/presentation/viewmodels/trip/trip_bloc.dart';
import '../../../trip/presentation/viewmodels/trip/trip_event.dart';
import '../../../trip/presentation/viewmodels/trip_request/trip_request_bloc.dart';
import '../../../trip/presentation/viewmodels/trip_request/trip_request_state.dart';
import '../viewmodel/friend_bloc.dart';
import '../viewmodel/friend_event.dart';
import '../viewmodel/friend_state.dart';
import '../widget/trip_invite_popup_widget.dart';
import 'friend_list_screen.dart';

/// [엄수빈] 친구 리스트를 감싸는 위젯
class FriendBlocWidget extends StatelessWidget {
  final int userId;

  const FriendBlocWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // ✅ FriendBloc
        BlocProvider(
          create: (_) {
            final bloc = sl<FriendBloc>();
            bloc.add(FriendEvent.getFriendUsers(myId: userId));
            return bloc;
          },
        ),

        // ✅ TripBloc (팝업에서 내 여행 목록 보여주려면 필요)
        BlocProvider(
          create: (_) {
            final bloc = sl<TripBloc>();
            bloc.add(TripEvent.getMyTrips(userId: userId)); // 내 여행 불러오기
            return bloc;
          },
        ),

        // ✅ TripRequestBloc (초대 보내기 이벤트용)
        BlocProvider(create: (_) => sl<TripRequestBloc>()),
      ],
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
        if (state.pageState == FriendPageState.success) {
          ToastPop.show(state.message ?? '완료되었습니다');
        }
        if (state.pageState == FriendPageState.error) {
          ToastPop.show(state.message ?? '오류가 발생했습니다');
        }
      },
      builder: (context, state) {
        final screen = FriendListScreen(
          userId: userId,
          onRight: (myId, friendId, friendNickname) {
            final tripBloc = context.read<TripBloc>();
            final tripReqBloc = context.read<TripRequestBloc>();

            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (dialogContext) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: tripBloc),
                    BlocProvider.value(value: tripReqBloc),
                  ],
                  child: BlocConsumer<TripRequestBloc, TripRequestState>(
                    listener: (context, trState) {
                      if (trState.pageState == TripRequestPageState.success) {
                        ToastPop.show(trState.message ?? '여행 초대를 보냈어요 ✈️');
                      }

                      if (trState.pageState == TripRequestPageState.error) {
                        ToastPop.show(trState.message ?? '초대에 실패했어요');
                      }
                    },
                    builder: (context, trState) {
                      return TripInvitePopUp(
                        myUserId: myId,
                        targetUserId: friendId,
                        targetNickname: friendNickname,
                      );
                    },
                  ),
                );
              },
            );
          },
        );

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
