import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_bloc.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_state.dart';
import 'package:my_travel_friend/feature/friend/presentation/widget/empty_card_widget.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/util/friend_link.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/pop_up_box.dart';
import '../../../../core/widget/text_box.dart';
import '../../../../core/widget/toast_pop.dart';
import '../widget/request_friend_widget.dart';

/// [엄수빈] 친구 추가 화면
class FriendRequestScreen extends StatelessWidget {
  final int requestId;
  final FriendRequestState state;

  final ValueChanged<String> onSearchChanged;
  final ValueChanged<int> onRequestCreate;

  const FriendRequestScreen({
    super.key,
    required this.requestId,
    required this.state,
    required this.onSearchChanged,
    required this.onRequestCreate,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = cs.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _NicknameSearchCard(onChanged: onSearchChanged),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: _SearchResultSection(
                  state: state,
                  onRequestCreate: onRequestCreate,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(child: _RinkSection(myUserId: requestId)),
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
            color: AppColors.dark.withValues(alpha: 0.06),
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
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

/// 검색 섹션
class _SearchResultSection extends StatelessWidget {
  final FriendRequestState state;
  final ValueChanged<int> onRequestCreate;
  const _SearchResultSection({
    super.key,
    required this.state,
    required this.onRequestCreate,
  });

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
                      onRequestCreate(userId);
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
        Text(
          "검색 결과",
          style: AppFont.small.copyWith(
            color: cs.onSurface,
            fontWeight: FontWeight.w600,
          ),
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
                color: AppColors.dark.withValues(alpha: 0.06),
              ),
            ],
          ),
          child: content,
        ),
      ],
    );
  }
}

// 링크 세션
class _RinkSection extends StatelessWidget {
  final int myUserId;

  const _RinkSection({super.key, required this.myUserId});

  String get _inviteLink => createInviteLink(myUserId);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "링크로 친구 추가",
          style: AppFont.small.copyWith(
            color: cs.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),

        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
          decoration: BoxDecoration(
            color: cs.onPrimary,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                offset: const Offset(0, 4),
                color: AppColors.dark.withValues(alpha: 0.06),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 설명 문구
              const Text(
                "링크를 공유해서 친구를 추가해보세요",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),

              // 링크 미리보기 박스
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _inviteLink,
                  style: TextStyle(
                    fontSize: 12,
                    color: cs.onSurface.withOpacity(0.7),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  // 복사 버튼
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        await Clipboard.setData(
                          ClipboardData(text: _inviteLink),
                        );
                        ToastPop.show('친구에게 공유해 보세요!');
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('복사'),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // 공유 버튼
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        await SharePlus.instance.share(
                          ShareParams(text: '내 여행 친구가 되어줘 ✈️\n\n$_inviteLink'),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cs.primary,
                        foregroundColor: cs.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('공유'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
