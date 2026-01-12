import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/widget/button.dart';
import 'package:my_travel_friend/feature/friend/presentation/widget/empty_card_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/pop_up_box.dart';
import '../../../../core/widget/text_box.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../viewmodel/friend_bloc.dart';
import '../viewmodel/friend_event.dart';
import '../widget/friend_widget.dart';

/// [엄수빈] 친구 목록 화면 (UI 전용)
class FriendListScreen extends StatelessWidget {
  final int userId;

  final void Function(int myId, int targetUserId, String targetNickname)
  onRight;

  const FriendListScreen({
    super.key,
    required this.userId,
    required this.onRight,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = cs.brightness == Brightness.dark;
    final bloc = context.read<FriendBloc>();

    // 검색어/검색결과 가져오기
    final String keyword = context.select((FriendBloc b) => b.state.keyword);
    final List<UserEntity> searchedUsers = context.select(
      (FriendBloc b) => b.state.results,
    );
    final bool isSearch = bloc.state.searchToggle;

    // 검색창에 뭔가를 입력했는지 여부
    final bool isSearching = keyword.trim().isNotEmpty;

    // 친구 0명 방지용 기본목록
    final users = context.select((FriendBloc b) => b.state.friendUsers);
    //실제로 화면에 보여줄 리스트
    final List<UserEntity> displayList = isSearching ? searchedUsers : users;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
      appBar: CustomButtonAppBar(
        title: "친구 목록",
        leading: Button(
          onTap: () => context.pop(),
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
              bloc.add(FriendEvent.searchToggle());
            },
            width: 40,
            height: 40,
            contentColor: AppColors.lessLight,
            borderRadius: 20,
            icon: isSearch ? Icon(AppIcon.close) : Icon(AppIcon.search),
          ),

          // 친구 추가
          Button(
            onTap: () => context.pushNamed(
              'friendRequest',
              extra: {'requestId': userId},
            ),
            width: 40,
            height: 40,
            contentColor: AppColors.lessLight,
            borderRadius: 20,
            icon: Icon(AppIcon.invite),
          ),
        ],
      ),

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSearch
                  ? TextBox(
                      hintText: '검색',
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: cs.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      onChanged: (value) {
                        bloc.add(FriendEvent.keywordChanged(value));
                      },
                    )
                  : Text(
                      "친구 ${users.length}명",
                      style: AppFont.small.copyWith(
                        color: cs.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

              const SizedBox(height: 12),

              Expanded(
                child: displayList.isEmpty
                    ? EmptyCard(
                        title: isSearching ? '검색 결과가 없어요' : '아직 추가한 친구가 없어요',
                        subtitle: isSearching
                            ? ' 다른 검색어로 다시 시도해보세요'
                            : '친구를 추가하고\n함께 여행을 계획해보세요',
                        icon: isSearching ? AppIcon.search : AppIcon.heart,
                        iconColor: isSearching ? AppColors.navy : cs.secondary,
                      )
                    : Material(
                        color: cs.surface,
                        elevation: 3,
                        borderRadius: BorderRadius.circular(24),
                        clipBehavior: Clip.antiAlias,
                        child: ListView.separated(
                          itemCount: displayList.length,
                          separatorBuilder: (_, __) => Divider(
                            indent: 16,
                            endIndent: 16,
                            height: 1,
                            color: cs.primaryContainer.withOpacity(0.3),
                          ),
                          itemBuilder: (context, index) {
                            final user = displayList[index];

                            return FriendWidget(
                              user: user,
                              onMoreGoTravel: () {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return PopUpBox(
                                      title: '함께 여행가기',
                                      message:
                                          '"${user.nickname}"님과 \n함께 여행을 떠나보세요',
                                      leftText: '새로운 여행',
                                      rightText: '내 여행에 초대',
                                      icon: AppIcon.airplane,
                                      iconColor: cs.primary,

                                      onLeft: () {
                                        context.pushNamed(
                                          'tripCreate',
                                          extra: {'friendId': user.id},
                                        );
                                      },
                                      onRight: () {
                                        onRight(
                                          userId,
                                          user.id ?? 0,
                                          user.nickname ?? '',
                                        );
                                      },
                                    );
                                  },
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
                                        bloc.add(
                                          FriendEvent.deleteFriend(
                                            myUserId: userId,
                                            friendUserId: user.id,
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
          ),
        ),
      ),
    );
  }
}
