import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/pop_up_box.dart';
import '../viewmodel/friend_request_bloc.dart';
import '../viewmodel/friend_request_event.dart';
import '../viewmodel/friend_request_state.dart';
import '../widget/empty_card_widget.dart';
import '../widget/friend_recevice_widget.dart';

class ReceviceListScreen extends StatelessWidget {
  final int userId;
  const ReceviceListScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: CustomButtonAppBar(
        title: "받은 친구 요청",
        leading: Button(
          onTap: () => context.pop(),
          width: 40,
          height: 40,
          icon: Icon(AppIcon.back),
          contentColor: AppColors.lessLight,
          borderRadius: 20,
        ),
      ),

      body: BlocListener<FriendRequestBloc, FriendRequestState>(
        listenWhen: (p, c) =>
            p.pageState != c.pageState &&
            (c.actionType == 'accept' || c.actionType == 'delete'),
        listener: (context, state) {
          if (state.pageState == FriendRequestPageState.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.actionType == 'accept' ? '수락하였습니다!' : '거절하였습니다!',
                ),
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.all(16),
              ),
            );

            context.read<FriendRequestBloc>().add(
              FriendRequestEvent.getFriendRequest(userId: userId),
            );
            context.read<FriendRequestBloc>().add(
              FriendRequestEvent.getRequestProfile(myId: userId),
            );
          }
        },

        child: BlocBuilder<FriendRequestBloc, FriendRequestState>(
          builder: (context, state) {
            final users = state.requestProfiles;
            final requests = state.friendRequest;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("받은 친구 요청: ${users.length}개"),
                  const SizedBox(height: 12),

                  Expanded(
                    child: users.isEmpty
                        ? const EmptyCard(
                            title: '받은 친구 요청이 없어요',
                            subtitle: '새로운 친구 요청이 오면 여기에 표시됩니다',
                            icon: AppIcon.okay,
                          )
                        : ListView.separated(
                            itemCount: users.length,
                            separatorBuilder: (_, __) => const Divider(),
                            itemBuilder: (context, index) {
                              final user = users[index];

                              final req = requests
                                  .where((r) => r.requestId == user.id)
                                  .cast()
                                  .toList();

                              final requestRowId = req.isEmpty
                                  ? null
                                  : req.first.id;
                              final createdAt = req.isEmpty
                                  ? ''
                                  : req.first.createdAt;

                              return FriendReceviceWidget(
                                user: user,
                                time: createdAt ?? '',

                                /// 거절
                                onLeft: requestRowId == null
                                    ? null
                                    : () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (_) => PopUpBox(
                                            title: '친구 거절 확인',
                                            message:
                                                '${user.nickname}님을 삭제할까요?',
                                            leftText: '취소',
                                            rightText: '삭제',
                                            onRight: () {
                                              context.read<FriendRequestBloc>().add(
                                                FriendRequestEvent.deleteRequest(
                                                  id: requestRowId,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },

                                /// 수락
                                onRight: requestRowId == null
                                    ? null
                                    : () {
                                        context.read<FriendRequestBloc>().add(
                                          FriendRequestEvent.acceptRequest(
                                            id: requestRowId,
                                          ),
                                        );
                                      },
                              );
                            },
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
