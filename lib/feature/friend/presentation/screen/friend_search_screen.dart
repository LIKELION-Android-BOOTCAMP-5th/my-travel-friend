// lib/feature/friend/presentation/screen/friend_search_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/feature/friend/presentation/widget/empty_card.dart';

import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/button.dart';
import '../../../../core/widget/text_box.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_icon.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../viewmodel/friend_search_bloc.dart';
import '../viewmodel/friend_search_event.dart';
import '../viewmodel/friend_search_state.dart';
import '../widget/friend_widget.dart';

class FriendSearchScreen extends StatelessWidget {
  const FriendSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        appBar: CustomButtonAppBar(
          title: "친구 검색",
          leading: Button(
            width: 40,
            height: 40,
            icon: Icon(AppIcon.back),
            contentColor: AppColors.lessLight,
            borderRadius: 20,
            onTap: () {
              context.pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 검색 필드
              TextBox(
                hintText: '검색',
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: cs.onSurfaceVariant,
                ),
                maxLines: 1,
                onChanged: (value) {
                  context.read<FriendSearchBloc>().add(
                    FriendSearchEvent.keywordChanged(value),
                  );
                },
              ),
              const SizedBox(height: 12),

              // 리스트 / 빈 상태
              Expanded(
                child: BlocBuilder<FriendSearchBloc, FriendSearchState>(
                  builder: (context, state) {
                    if (state.pageState == FriendSearchPageState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.pageState == FriendSearchPageState.error) {
                      return Center(
                        child: Text(state.message ?? '친구 검색 중 오류가 발생했어요.'),
                      );
                    }

                    final List<UserEntity> friends = state.results;
                    final keyword = state.keyword;

                    // 검색어 있고, 결과 없을 때
                    if (keyword.isNotEmpty && friends.isEmpty) {
                      return const EmptyCard(
                        title: '검색 결과가 없어요',
                        subtitle: '다른 검색어로 다시 시도해보세요',
                      );
                    }

                    // 검색어도 없고, 결과도 없을 때 (초기 상태)
                    if (keyword.isEmpty && friends.isEmpty) {
                      return const EmptyCard(
                        title: '친구를 검색해보세요',
                        subtitle: '상단 검색창에 친구 닉네임을 입력해보세요',
                      );
                    }

                    // 결과 리스트
                    return ListView.separated(
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: friends.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final user = friends[index];
                        return FriendWidget(user: user);
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
