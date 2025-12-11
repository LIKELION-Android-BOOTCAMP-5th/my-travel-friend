import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/widget/button.dart';
import 'package:my_travel_friend/feature/friend/presentation/widget/empty_card.dart';

import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/pop_up_box.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_icon.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/entities/friend_entity.dart';
import '../viewmodel/friend_bloc.dart';
import '../viewmodel/friend_event.dart';
import '../viewmodel/friend_state.dart';
import '../widget/friend_widget.dart';

/// [엄수빈] 친구 목록 화면 (UI 전용)
class FriendListScreen extends StatelessWidget {
  final int userId;

  const FriendListScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        appBar: CustomButtonAppBar(
          title: "친구 목록",
          leading: Button(
            onTap: () {
              context.pop();
            },
            width: 40,
            height: 40,
            icon: Icon(AppIcon.back),
            contentColor: AppColors.lessLight,
            borderRadius: 20,
          ),
          actions: [
            // 친구 검색
            Button(
              onTap: () {
                context.push('/friend/search', extra: {'userId': userId});
              },
              width: 40,
              height: 40,
              contentColor: AppColors.lessLight,
              borderRadius: 20,
              icon: Icon(AppIcon.search),
            ),
            // 친구 추가
            Button(
              onTap: () {
                context.push('/friend/request', extra: {'requestId': userId});
              },
              width: 40,
              height: 40,
              contentColor: AppColors.lessLight,
              borderRadius: 20,
              icon: Icon(AppIcon.invite),
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<FriendBloc, FriendState>(
            builder: (context, state) {
              // 에러 상태
              if (state.pageState == FriendPageState.error) {
                return Center(
                  child: Text(state.message ?? '친구 목록을 불러오지 못했어요.'),
                );
              }

              return _FriendListBody(
                friends: state.friends,
                myUserId: state.userId,
              );
            },
          ),
        ),
      ),
    );
  }
}

/// 친구 리스트를 실제로 그려주는 위젯
class _FriendListBody extends StatelessWidget {
  final List<FriendEntity> friends;
  final int myUserId;

  const _FriendListBody({
    super.key,
    required this.friends,
    required this.myUserId,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 상단 친구 수 표시
        Text("친구 ${friends.length}명"),
        const SizedBox(height: 12),

        // 리스트/빈화면 영역
        Expanded(
          child: friends.isEmpty
              ? EmptyCard(
                  title: '아직 추가한 친구가 없어요',
                  subtitle: '친구를 추가하고\n함께 여행을 계획해보세요',
                  icon: AppIcon.heart,
                  iconColor: cs.secondary,
                )
              : Material(
                  color: cs.surface,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(24),
                  clipBehavior: Clip.antiAlias,
                  child: ListView.separated(
                    itemCount: friends.length,
                    separatorBuilder: (_, __) => Divider(
                      indent: 16,
                      endIndent: 16,
                      height: 1,
                      color: cs.primaryContainer.withOpacity(0.3),
                    ),
                    itemBuilder: (context, index) {
                      final friend = friends[index];

                      // 나 기준으로 상대방 userId 구하기
                      final int? rawFriendUserId = friend.userId1 == myUserId
                          ? friend.userId2
                          : friend.userId1;

                      if (rawFriendUserId == null) {
                        return const SizedBox.shrink();
                      }

                      final int friendUserId = rawFriendUserId;

                      // TODO: 친구 검색이 맞다면,, 친구목록도 userEntity로 가져올 예정
                      final user = UserEntity(
                        id: friendUserId,
                        nickname: '친구 $friendUserId',
                        profileImg: null,
                      );

                      return FriendWidget(
                        user: user,
                        onMoreGoTravel: () {
                          context.push(
                            '/trip/create',
                            extra: {'friendId': friendUserId},
                          );
                        },
                        onMoreDeleteFriend: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return PopUpBox(
                                title: '친구 삭제 확인',
                                message:
                                    '${user.nickname}님이 목록에서 삭제됩니다.\n정말 삭제하시겠습니까?',
                                leftText: '취소',
                                rightText: '삭제',
                                icon: AppIcon.removeUser,
                                iconColor: cs.secondary,
                                onRight: () {
                                  context.read<FriendBloc>().add(
                                    FriendEvent.deleteFriend(
                                      myUserId: myUserId,
                                      friendUserId: friendUserId,
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
