import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/pop_up_box.dart';
import '../../../../core/widget/text_box.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_icon.dart';
import '../viewmodel/friend_request_state.dart';
import '../widget/empty_card_widget.dart';
import '../widget/request_friend_widget.dart';

class FriendRequestScreen extends StatelessWidget {
  final int requestId;

  // ✅ UI는 state를 주입받기만
  final FriendRequestState state;

  // ✅ UI는 콜백만 호출
  final ValueChanged<String> onSearchChanged;
  final void Function(int targetId) onConfirmRequest;

  const FriendRequestScreen({
    super.key,
    required this.requestId,
    required this.state,
    required this.onSearchChanged,
    required this.onConfirmRequest,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: cs.surface,
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _NicknameSearchCard(onChanged: onSearchChanged),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: _SearchResultSection(
                  requestId: requestId,
                  state: state,
                  onConfirmRequest: onConfirmRequest,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              const SliverToBoxAdapter(child: _InviteLinkSection()),
            ],
          ),
        ),
      ),
    );
  }
}

class _NicknameSearchCard extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const _NicknameSearchCard({super.key, required this.onChanged});

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
            prefixIcon: const Icon(AppIcon.search),
            onChanged: onChanged, // ✅ bloc 모름
          ),
        ],
      ),
    );
  }
}

class _SearchResultSection extends StatelessWidget {
  final int requestId;
  final FriendRequestState state;
  final void Function(int targetId) onConfirmRequest;

  const _SearchResultSection({
    super.key,
    required this.requestId,
    required this.state,
    required this.onConfirmRequest,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final keyword = state.keyword.trim();
    final results = state.searchResults;

    Widget content;

    /// 1️⃣ 검색 전
    if (keyword.isEmpty) {
      content = const EmptyCard(
        title: '닉네임으로 친구를 검색하세요',
        subtitle: '위 검색창에 닉네임을 입력해보세요',
      );
    }
    /// 2️⃣ 검색 결과 없음
    else if (results.isEmpty) {
      content = const EmptyCard(
        title: '검색 결과가 없어요',
        subtitle: '닉네임을 다시 확인해보세요',
      );
    }
    /// 3️⃣ 검색 결과 있음
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
              onClick: () {
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
                      onConfirmRequest(userId); // ✅ bloc 모름
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
                  // TODO: 클립보드 복사 로직
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
