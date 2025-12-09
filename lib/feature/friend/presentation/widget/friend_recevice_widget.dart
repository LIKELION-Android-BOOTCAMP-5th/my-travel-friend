import 'package:flutter/material.dart';

/// 받은 친구 요청 1개를 보여주는 카드 위젯
class ReceivedFriendRequestCard extends StatelessWidget {
  final String nickname; // 예: '김태희'
  final String subtitle; // 예: '공통 친구 2명 · 3일 전'
  final String? profileImageUrl; // 프로필 이미지 (없으면 기본 원형)
  final VoidCallback onAccept; // 수락 버튼 콜백
  final VoidCallback onReject; // 거절 버튼 콜백

  const ReceivedFriendRequestCard({
    super.key,
    required this.nickname,
    required this.subtitle,
    this.profileImageUrl,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 프로필 + 텍스트
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileImage(),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nickname, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Text(subtitle, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 수락 / 거절 버튼
          Row(
            children: [
              // 수락 버튼 (파란색, 체크 아이콘)
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton.icon(
                    onPressed: onAccept,
                    icon: const Icon(Icons.check, size: 18),
                    label: const Text('수락'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // 거절 버튼 (회색, X 아이콘)
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: OutlinedButton.icon(
                    onPressed: onReject,
                    icon: const Icon(Icons.close, size: 18),
                    label: const Text('거절'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      side: BorderSide(color: Colors.grey[400]!),
                      foregroundColor: Colors.grey[800],
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 프로필 이미지 (URL 있으면 NetworkImage, 없으면 이니셜 원)
  Widget _buildProfileImage() {
    if (profileImageUrl != null && profileImageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(profileImageUrl!),
      );
    }

    // 기본: 이니셜 원
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.grey[300],
      child: Text(
        nickname.isNotEmpty ? nickname.characters.first : '?',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
