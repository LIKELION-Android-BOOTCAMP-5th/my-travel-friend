import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/widget/app_bar.dart';

import '../widget/friend_widget.dart';
// friend_more_menu_button.dart는 friend_widget 안에서 import 하므로 여기선 필요 없음

class FriendListScreen extends StatelessWidget {
  final int userId;

  const FriendListScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    // 더미 데이터
    final friends = [
      {'name': '김지수', 'image': null},
      {'name': '박민준', 'image': null},
      {'name': '이서연', 'image': null},
      {'name': '정현우', 'image': null},
      {'name': '최유진', 'image': null},
      {'name': '강태민', 'image': null},
    ];

    return SafeArea(
      child: Scaffold(
        appBar: const CustomButtonAppBar(title: "친구 목록", actions: []),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "친구 ${friends.length}명",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

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
                    itemBuilder: (_, index) {
                      final f = friends[index];
                      return FriendWidget(
                        name: f['name']!,
                        profileImg: f['image'],
                        onTap: () {},
                        onMoreGoTravel: () {},
                        onMoreDeleteFriend: () {},
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
