import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/friend/presentation/screen/recevice_trip_screen.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_event.dart';

import '../../../../../core/DI/injection.dart';
import '../../../../../core/widget/toast_pop.dart';
import '../../../trip/presentation/viewmodels/trip/trip_bloc.dart';
import '../../../trip/presentation/viewmodels/trip/trip_event.dart';
import '../../../trip/presentation/viewmodels/trip_request/trip_request_bloc.dart';
import '../../../trip/presentation/viewmodels/trip_request/trip_request_event.dart';
import '../../../trip/presentation/viewmodels/trip_request/trip_request_state.dart';
import '../viewmodel/friend_bloc.dart';

class ReceviceTripBlocWidget extends StatelessWidget {
  final int myId;
  const ReceviceTripBlocWidget({super.key, required this.myId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final bloc = sl<TripBloc>();
            bloc.add(TripEvent.getMyTrips(userId: myId));
            return bloc;
          },
        ),
        BlocProvider(
          create: (_) {
            final bloc = sl<TripRequestBloc>();
            bloc.add(TripRequestEvent.getTripRequest(myId: myId));
            return bloc;
          },
        ),
        BlocProvider(
          create: (_) {
            final bloc = sl<FriendBloc>();
            bloc.add(FriendEvent.getFriendUsers(myId: myId));
            return bloc;
          },
        ),
      ],
      child: _ReceviceTripConsumer(myUserId: myId),
    );
  }
}

class _ReceviceTripConsumer extends StatelessWidget {
  final int myUserId;
  const _ReceviceTripConsumer({required this.myUserId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripRequestBloc, TripRequestState>(
      listener: (context, trState) {
        if (trState.pageState == TripRequestPageState.success) {
          final action = trState.actionType;

          if (action == 'accept') {
            ToastPop.show(trState.message ?? '여행 초대를 수락했어요 ✈️');
          } else if (action == 'add') {
            ToastPop.show(trState.message ?? '여행에 참여했어요 🙌');
          } else if (action == 'delete') {
            ToastPop.show(trState.message ?? '초대를 거절했어요');
          } else if (action == 'create') {
            ToastPop.show(trState.message ?? '초대를 보냈어요');
          } else {
            ToastPop.show(trState.message ?? '완료');
          }
          if (trState.actionType == 'accept' ||
              trState.actionType == 'delete') {
            context.read<TripRequestBloc>().add(
              TripRequestEvent.getTripRequest(myId: myUserId),
            );
          }
        }

        if (trState.pageState == TripRequestPageState.error) {
          ToastPop.show(trState.message ?? '오류가 발생했어요');
        }
      },
      builder: (context, trState) {
        final tripState = context.watch<TripBloc>().state;
        final friendState = context.watch<FriendBloc>().state;

        final screen = ReceviceTripScreen(
          myUserId: myUserId,
          fstate: friendState,
          trstate: trState,
          tstate: tripState,

          // 삭제
          onDelete: (requestRowId) {
            context.read<TripRequestBloc>().add(
              TripRequestEvent.deleteTripRequest(id: requestRowId),
            );
          },

          // 수락
          onAccept: (requestRowId, tripId) {
            context.read<TripRequestBloc>().add(
              TripRequestEvent.acceptTripRequest(
                requestId: requestRowId,
                tripId: tripId,
                myUserId: myUserId,
              ),
            );
          },
        );

        if (trState.pageState == TripRequestPageState.loading) {
          return Stack(
            children: [
              screen,
              Container(
                color: Colors.black.withOpacity(0.25),
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
