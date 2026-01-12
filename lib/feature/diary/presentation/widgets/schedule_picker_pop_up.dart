import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../schedule/domain/entities/schedule_entity.dart';
import '../../../trip/presentation/screens/edit_trip_screen.dart';

// [이재은] 일정 선택 팝업 (순수 UI - 데이터는 외부에서 주입)
class SchedulePickerPopup extends StatelessWidget {
  final List<ScheduleEntity> schedules;
  final bool isLoading;

  const SchedulePickerPopup({
    super.key,
    required this.schedules,
    this.isLoading = false,
  });

  /// 팝업 표시 (스케줄 목록을 외부에서 받음)
  static Future<ScheduleEntity?> show(
    BuildContext context, {
    required List<ScheduleEntity> schedules,
    bool isLoading = false,
  }) {
    return showModalBottomSheet<ScheduleEntity>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) =>
          SchedulePickerPopup(schedules: schedules, isLoading: isLoading),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // 핸들
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // 헤더
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  '일정에서 선택',
                  style: AppFont.regular.copyWith(
                    color: isDark ? AppColors.light : AppColors.dark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    AppIcon.close,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // 스케줄 목록
          Expanded(child: _buildContent(context)),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (schedules.isEmpty) {
      return Center(
        child: Text(
          '참여 중인 일정이 없어요',
          style: AppFont.medium.copyWith(color: colorScheme.onSurfaceVariant),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: schedules.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final schedule = schedules[index];

        return _ScheduleItem(
          schedule: schedule,
          onTap: () => context.pop(schedule),
        );
      },
    );
  }
}

class _ScheduleItem extends StatelessWidget {
  final ScheduleEntity schedule;
  final VoidCallback onTap;

  const _ScheduleItem({required this.schedule, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _getColor(schedule),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              schedule.title,
              style: AppFont.big.copyWith(
                color: isDark ? AppColors.light : AppColors.dark,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  formatDate(schedule.date),
                  style: AppFont.regular.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                if (schedule.place != null) ...[
                  const SizedBox(width: 16),
                  Text(
                    schedule.place!,
                    style: AppFont.regular.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(ScheduleEntity schedule) {
    return switch (schedule.categoryId) {
      1 => AppColors.lightPink.withOpacity(0.3),
      2 => AppColors.secondary.withOpacity(0.3),
      3 => AppColors.primaryLight.withOpacity(0.3),
      4 => AppColors.onMemoContainerDark.withOpacity(0.3),
      5 => AppColors.tertiary.withOpacity(0.3),
      6 => AppColors.lightPurple.withOpacity(0.3),
      7 => AppColors.lightGreen.withOpacity(0.3),
      8 => AppColors.navyOutline.withOpacity(0.3),
      _ => AppColors.navyOutline.withOpacity(0.3),
    };
  }
}
