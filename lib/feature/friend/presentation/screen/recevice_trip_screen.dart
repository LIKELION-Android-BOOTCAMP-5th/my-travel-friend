import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/trip_request/trip_request_state.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/pop_up_box.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../trip/domain/entities/trip_entity.dart';
import '../../../trip/presentation/viewmodels/trip/trip_state.dart';
import '../viewmodel/friend_state.dart';
import '../widget/empty_card_widget.dart';
import '../widget/recevice_trip_widget.dart';

class ReceviceTripScreen extends StatelessWidget {
  final int myUserId;
  final FriendState fstate;
  final TripState tstate;
  final TripRequestState trstate;

  final void Function(int requestRowId, int requestId) onAccept;
  final void Function(int requestRowId) onDelete;

  const ReceviceTripScreen({
    super.key,
    required this.myUserId,
    required this.fstate,
    required this.tstate,
    required this.trstate,
    required this.onAccept,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final users = fstate.friendUsers;
    final request = trstate.tripRequests;

    return Scaffold(
      appBar: CustomButtonAppBar(
        title: "받은 여행 초대",
        leading: Button(
          onTap: () => context.pop(),
          width: 40,
          height: 40,
          icon: Icon(AppIcon.back),
          contentColor: AppColors.lessLight,
          borderRadius: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: request.isEmpty
                  ? const EmptyCard(
                      title: '새로운 여행 초대가 없어요',
                      subtitle: '여행 초대가 오면 여기에 표시됩니다',
                      icon: AppIcon.mapPin,
                    )
                  : ListView.separated(
                      itemCount: request.length,
                      separatorBuilder: (_, __) => const Divider(height: 32),
                      itemBuilder: (context, index) {
                        final req = request[index]; // TripRequestEntity

                        final requestRowId = req.id; // trip_request
                        final inviterUserId = req.requestId; // 초대한 사람 userId
                        final tripId = req.tripId; // 여행 id

                        // 초대한 사람 찾기
                        UserEntity? hostUser;
                        if (inviterUserId != 0) {
                          for (final u in users) {
                            if (u.id == inviterUserId) {
                              hostUser = u;
                              break;
                            }
                          }
                        }

                        // 여행 찾기
                        TripEntity? trip;
                        if (tripId != null) {
                          for (final t in trstate.invitedTrips) {
                            if (t.id == tripId) {
                              trip = t;
                              break;
                            }
                          }
                        }

                        return ReceviceTripWidget(
                          request: req,
                          trip: trip,
                          hostUser: hostUser,

                          // 거절
                          onReject: (requestRowId == null)
                              ? () {}
                              : () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) => PopUpBox(
                                      title: '여행 거절 확인',
                                      message:
                                          '${hostUser?.nickname ?? "상대"}님의 \n초대를 거절할까요?',
                                      leftText: '취소',
                                      rightText: '삭제',
                                      icon: AppIcon.delete,
                                      onRight: () => onDelete(requestRowId),
                                    ),
                                  );
                                },

                          //수락
                          onAccept: (requestRowId == null || tripId == null)
                              ? () {}
                              : () => onAccept(requestRowId, tripId),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
