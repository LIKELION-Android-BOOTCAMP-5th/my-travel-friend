import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/util/time_ago.dart';
import '../../../../core/widget/profile_img.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../trip/domain/entities/trip_entity.dart';
import '../../../trip/domain/entities/trip_request_entity.dart';
import '../../../trip/presentation/widgets/trip_card.dart';

class ReceviceTripWidget extends StatelessWidget {
  final TripRequestEntity request;
  final TripEntity? trip;
  final UserEntity? hostUser;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const ReceviceTripWidget({
    super.key,
    required this.request,
    required this.trip,
    required this.hostUser,
    required this.onAccept,
    required this.onReject,
  });

  String _formatDate(String iso) {
    if (iso.isEmpty) return '';
    return iso.split('T').first.replaceAll('-', '.');
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias, // 카드/아래 영역이 한 덩어리로 붙게
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 상단: 여행 카드
          if (trip != null)
            TripCard(
              title: trip!.title,
              startDate: _formatDate(trip!.startAt),
              endDate: _formatDate(trip!.endAt),
              peopleCount: trip!.crewCount,

              // 이미지 아니면 색
              backgroundImageUrl: trip!.coverType == "IMAGE"
                  ? trip!.coverImg
                  : null,
              backgroundColor: trip!.coverType == "IMAGE"
                  ? null
                  : _getCoverColor(trip!.coverType),

              showMenu: false,
            )
          else
            Container(
              height: 160,
              alignment: Alignment.center,
              color: cs.surfaceVariant,
              child: const Text('여행 정보를 불러올 수 없어요'),
            ),

          // 하단: 사람 + 버튼
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    ProfileImg(radius: 18, imageUrl: hostUser?.profileImg),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '${hostUser?.nickname ?? "상대"}님이 초대했어요',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Text(
                      request.createdAt == null
                          ? ''
                          : '· ${TimeAgo.getTimeAgo(request.createdAt!)}',
                      style: TextStyle(
                        color: cs.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: TextButton(
                          onPressed: onAccept,
                          style: TextButton.styleFrom(
                            backgroundColor: cs.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            '수락',
                            style: TextStyle(color: AppColors.lessLight),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: TextButton(
                          onPressed: onReject,
                          style: TextButton.styleFrom(
                            backgroundColor: cs.outlineVariant,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            '거절',
                            style: TextStyle(color: cs.onSurface),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getCoverColor(String coverType) {
    switch (coverType) {
      case "Pink":
        return AppColors.lightPink;
      case "YELLOW":
        return AppColors.tertiary;
      case "BLUE":
        return AppColors.primaryLight;
      case "VIOLET":
        return AppColors.lightPurple;
      case "GREEN":
        return AppColors.lightGreen;
      case "RED":
        return AppColors.secondary;
      default:
        return AppColors.primaryLight;
    }
  }
}
