import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/widget/button.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_bloc.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_state.dart';

import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/text_box.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_icon.dart';

/// [엄수빈] 친구 추가 / 친구 요청 화면 (UI 전용)
class FriendRequestScreen extends StatelessWidget {
  final int requestId;

  const FriendRequestScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
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
        backgroundColor: cs.surface, // 연한 회색 배경 느낌
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<FriendRequestBloc, FriendRequestState>(
            builder: (context, state) {
              // 아직은 상태 안 쓰고, UI만 그림
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _NicknameSearchCard(),
                    SizedBox(height: 24),
                    //_SearchResultSection(),
                    SizedBox(height: 24),
                    _InviteLinkSection(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// 닉네임 검색 카드
class _NicknameSearchCard extends StatelessWidget {
  const _NicknameSearchCard({super.key});

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
              // TODO: 검색 이벤트 보내기
            },
          ),
        ],
      ),
    );
  }
}

/// 검색 결과 섹션
// class _SearchResultSection extends StatelessWidget {
//   /// final List<_MockSearchFriend> results; // 지금은 더미용 모델
//
//   const _SearchResultSection({super.key, });
//
//   @override
//   Widget build(BuildContext context) {
//     final cs = Theme.of(context).colorScheme;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "검색 결과",
//           style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//         ),
//         const SizedBox(height: 12),
//
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: cs.onPrimary,
//             borderRadius: BorderRadius.circular(18),
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//                 color: Colors.black.withOpacity(0.06),
//               ),
//             ],
//           ),
//
//           //결과 없으면 안내 카드
//           child: results.isEmpty
//               ? EmptyCard(
//                   title: '닉네임으로 친구를 검색하세요',
//                   subtitle: '위 검색창에 닉네임을 입력해보세요',
//                 )
//               // 결과 있으면 리스트
//               : ConstrainedBox(
//                   constraints: const BoxConstraints(maxHeight: 96.0 * 5),
//                   child: ListView.separated(
//                     shrinkWrap: true,
//                     // 5명 이하면 스크롤 안 생기게, 6명부터 스크롤
//                     physics: results.length > 5
//                         ? const BouncingScrollPhysics()
//                         : const NeverScrollableScrollPhysics(),
//                     itemCount: results.length,
//                     separatorBuilder: (_, __) => const SizedBox(height: 8),
//                     itemBuilder: (context, index) {
//                       final item = results[index];
//                       return FriendRequestWidget(
//                         nickname: item.nickname,
//                         mutualCount: item.mutualCount,
//                         onTapAdd: () {
//                           // TODO: 나중에 Bloc으로 "친구 추가" 이벤트 보내기
//                         },
//                       );
//                     },
//                   ),
//                 ),
//         ),
//       ],
//     );
//   }
// }

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
