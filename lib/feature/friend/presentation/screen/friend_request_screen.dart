import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/widget/button.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_bloc.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_state.dart';
import 'package:my_travel_friend/feature/friend/presentation/widget/empty_card_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/pop_up_box.dart';
import '../../../../core/widget/text_box.dart';
import '../viewmodel/friend_request_event.dart';
import '../widget/request_friend_widget.dart';

/// [엄수빈] 친구 추가 / 친구 요청 화면 (UI 전용)
class FriendRequestScreen extends StatelessWidget {
  final int requestId;

  const FriendRequestScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = cs.brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomButtonAppBar(
        title: "친구 추가",
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
      ),
      backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<FriendRequestBloc, FriendRequestState>(
          listenWhen: (prev, curr) =>
              prev.pageState != curr.pageState &&
              curr.actionType == 'request_create',
          listener: (context, state) {
            // 요청 성공하면 현재 검색어로 다시 검색 => 화면 리로드 효과
            if (state.pageState == FriendRequestPageState.success) {
              context.read<FriendRequestBloc>().add(
                FriendRequestEvent.searchRequestName(
                  myId: requestId,
                  keyword: state.keyword, // 지금 검색어 그대로
                ),
              );
            }
          },
          child: BlocBuilder<FriendRequestBloc, FriendRequestState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: _NicknameSearchCard(requestId: requestId),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  SliverToBoxAdapter(
                    child: _SearchResultSection(requestId: requestId),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  // const SliverToBoxAdapter(child: _InviteLinkSection()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NicknameSearchCard extends StatelessWidget {
  final int requestId;
  const _NicknameSearchCard({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      decoration: BoxDecoration(
        color: cs.onPrimary,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.06),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "닉네임으로 검색",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          TextBox(
            hintText: "닉네임 입력...",
            prefixIcon: Icon(AppIcon.search),
            onChanged: (value) {
              context.read<FriendRequestBloc>().add(
                FriendRequestEvent.searchRequestName(
                  myId: requestId,
                  keyword: value,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// 검색 섹션
class _SearchResultSection extends StatelessWidget {
  final int requestId;
  const _SearchResultSection({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final state = context.watch<FriendRequestBloc>().state;

    final keyword = state.keyword.trim();
    final results = state.searchResults;

    Widget content;

    // 검색 전
    if (keyword.isEmpty) {
      content = EmptyCard(
        title: '닉네임으로 친구를 검색하세요',
        subtitle: '위 검색창에 닉네임을 입력해보세요',
      );
    }
    // 검색 결과 없음
    else if (results.isEmpty) {
      content = EmptyCard(title: '검색 결과가 없어요', subtitle: '닉네임을 다시 확인해보세요');
    }
    // 검색 결과 리스트
    else {
      content = ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 96.0 * 5),
        child: ListView.separated(
          shrinkWrap: true,
          physics: results.length > 2
              ? const BouncingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          itemCount: results.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final user = results[index];
            final userId = user.id ?? 0;
            final isRequested = state.requestedUserIds.contains(userId);

            return RequestFriendWidget(
              user: user,
              isRequested: isRequested,
              onClick: () async {
                // 이미 요청됨이면 무시
                if (isRequested) return;

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => PopUpBox(
                    title: '친구 추가',
                    message: '${user.nickname ?? ''}님에게 친구 요청을 보낼까요?',
                    showIcon: false,
                    leftText: '취소',
                    rightText: '추가하기',
                    onLeft: () {},
                    onRight: () {
                      // 확인 누르면 요청 보내기
                      context.read<FriendRequestBloc>().add(
                        FriendRequestEvent.requestCreate(
                          requestId: requestId,
                          targetId: userId,
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "검색 결과",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: cs.onPrimary,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                offset: const Offset(0, 4),
                color: Colors.black.withOpacity(0.06),
              ),
            ],
          ),
          child: content,
        ),
      ],
    );
  }
}

/// 친구 초대 링크 공유
class _InviteLinkSection extends StatelessWidget {
  const _InviteLinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "친구 초대 링크 공유",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: cs.onPrimary,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                offset: const Offset(0, 4),
                color: Colors.black.withOpacity(0.06),
              ),
            ],
          ),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "https://mytravel.app/add/user123",
                  style: TextStyle(
                    fontSize: 13,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  // TODO: 클립보드 복사 로직 (나중에 추가)
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: cs.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.copy,
                    size: 20,
                    color: AppColors.lessLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
