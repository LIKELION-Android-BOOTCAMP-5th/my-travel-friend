import 'package:flutter/material.dart';

class FriendMoreMenuButton extends StatelessWidget {
  final VoidCallback? onGoTravel; // 친구랑 여행가기
  final VoidCallback? onDeleteFriend; // 친구 삭제

  const FriendMoreMenuButton({super.key, this.onGoTravel, this.onDeleteFriend});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return PopupMenuButton(
      icon: Icon(Icons.more_vert, color: cs.onPrimary),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      offset: const Offset(-20, 10), // 팝업 위치 약간 조정
      padding: EdgeInsets.zero,
      itemBuilder: (context) => [
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Icon(Icons.flight_takeoff, size: 12, color: cs.primary),
              const SizedBox(width: 8),
              Text(
                "친구랑 여행가기",
                style: TextStyle(
                  color: cs.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          onTap: onGoTravel,
        ),
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Icon(Icons.person_remove_outlined, size: 12, color: cs.secondary),
              const SizedBox(width: 8),
              Text(
                "친구 삭제",
                style: TextStyle(
                  color: cs.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          onTap: onDeleteFriend,
        ),
      ],
    );
  }
}
