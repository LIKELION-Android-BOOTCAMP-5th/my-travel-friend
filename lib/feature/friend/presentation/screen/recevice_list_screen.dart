import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/pop_up_box.dart';
import '../viewmodel/friend_request_state.dart';
import '../widget/empty_card_widget.dart';
import '../widget/friend_recevice_widget.dart';

// [엄수빈] 내가 받은 친구 요청들 화면
class ReceviceListScreen extends StatelessWidget {
  final int userId;
  final FriendRequestState state;

  final void Function(int requestRowId, int requestId) onAccept;
  final void Function(int requestRowId) onDelete;

  const ReceviceListScreen({
    super.key,
    required this.userId,
    required this.state,
    required this.onAccept,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final users = state.requestProfiles;
    final requests = state.friendRequest;

    return SafeArea(
      child: Scaffold(
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
        body: Padding(
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
                              .toList();

                          final requestRowId = req.isEmpty
                              ? null
                              : req.first.id;
                          final createdAt = req.isEmpty
                              ? ''
                              : (req.first.createdAt ?? '');

                          return FriendReceviceWidget(
                            user: user,
                            time: createdAt,

                            // 거절
                            onLeft: requestRowId == null
                                ? null
                                : () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (_) => PopUpBox(
                                        title: '친구 거절 확인',
                                        message: '${user.nickname}님을 삭제할까요?',
                                        leftText: '취소',
                                        rightText: '삭제',
                                        onRight: () {
                                          onDelete(requestRowId);
                                        },
                                      ),
                                    );
                                  },

                            // 수락
                            onRight: requestRowId == null
                                ? null
                                : () {
                                    onAccept(requestRowId, user.id ?? 0);
                                  },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
