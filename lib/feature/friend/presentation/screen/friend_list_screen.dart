import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/app_bar.dart';
import '../../domain/entities/friend_entity.dart';
import '../viewmodel/friend_bloc.dart';
import '../viewmodel/friend_event.dart';
import '../viewmodel/friend_state.dart';
import '../widget/friend_widget.dart';

// [엄수빈] 친구 목록 화면 (UI 전용)

class FriendListScreen extends StatelessWidget {
  const FriendListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomButtonAppBar(title: "친구 목록", actions: []),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<FriendBloc, FriendState>(
            builder: (context, state) {
              // 🔹 에러 상태일 때만 별도 에러 화면
              if (state.pageState == FriendPageState.error) {
                return Center(
                  child: Text(
                    state.message ?? '친구 목록을 불러오지 못했어요.',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: cs.error),
                  ),
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

/// 친구 리스트
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
        /// 상단에 친구 수 표시
        Text("친구 ${friends.length}명"),
        const SizedBox(height: 12),

        /// 친구 목록 카드
        Expanded(
          child: Material(
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

                final int? rawFriendUserId = friend.userId1 == myUserId
                    ? friend.userId2
                    : friend.userId1;

                // 둘 다 null 이면 이상한 데이터 → 그냥 빈 칸 반환
                if (rawFriendUserId == null) {
                  return const SizedBox.shrink();
                }

                final int friendUserId = rawFriendUserId;

                return FriendWidget(
                  //supabase 추후 연결
                  name: '친구 $friendUserId',
                  profileImg: null,
                  onMoreGoTravel: () {
                    // 함께 여행가기
                    context.read<FriendBloc>().add(
                      FriendEvent.goTravel(
                        myUserId: myUserId,
                        friendUserId: friendUserId,
                      ),
                    );
                  },
                  onMoreDeleteFriend: () {
                    // 친구 삭제
                    context.read<FriendBloc>().add(
                      FriendEvent.deleteFriend(
                        myUserId: myUserId,
                        friendUserId: friendUserId,
                      ),
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
