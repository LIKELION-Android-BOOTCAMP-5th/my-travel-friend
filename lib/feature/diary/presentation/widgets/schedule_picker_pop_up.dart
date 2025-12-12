import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/result/result.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../schedule/domain/entities/schedule_entity.dart';
import '../../../schedule/domain/usecases/get_user_schudule_usecase.dart';
import '../../../trip/presentation/screens/edit_trip_screen.dart';

// [이재은] 일정 선택 팝업
class SchedulePickerPopup extends StatefulWidget {
  final int tripId;
  final int userId;

  const SchedulePickerPopup({
    super.key,
    required this.tripId,
    required this.userId,
  });

  static Future<ScheduleEntity?> show(
    BuildContext context, {
    required int tripId,
    required int userId,
  }) {
    return showModalBottomSheet<ScheduleEntity>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => SchedulePickerPopup(tripId: tripId, userId: userId),
    );
  }

  @override
  State<SchedulePickerPopup> createState() => _ScheduleSelectPopupState();
}

class _ScheduleSelectPopupState extends State<SchedulePickerPopup> {
  List<ScheduleEntity> _schedules = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSchedules();
  }

  Future<void> _loadSchedules() async {
    final useCase = GetIt.instance<GetUserScheduleUseCase>();

    final res = await useCase(tripId: widget.tripId, userId: widget.userId);

    if (mounted) {
      res.when(
        success: (schedules) {
          setState(() {
            _schedules = schedules;
            _isLoading = false;
          });
        },
        failure: (_) {
          setState(() {
            _schedules = [];
            _isLoading = false;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // 핸들
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // 헤더
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  '일정에서 선택',
                  style: AppFont.regular.copyWith(
                    color: isDark ? AppColors.light : AppColors.dark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    AppIcon.close,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1),

          // 스케줄 목록
          Expanded(child: _buildContent(context)),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_schedules.isEmpty) {
      return Center(
        child: Text(
          '참여 중인 일정이 없어요',
          style: AppFont.medium.copyWith(color: colorScheme.onSurfaceVariant),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: _schedules.length,
      separatorBuilder: (_, __) => SizedBox(height: 8),
      itemBuilder: (context, index) {
        final schedule = _schedules[index];

        return _ScheduleItem(
          schedule: schedule,
          onTap: () => Navigator.pop(context, schedule),
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
        padding: EdgeInsets.all(16),
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
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  formatDate(schedule.date),
                  style: AppFont.regular.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                if (schedule.place != null) ...[
                  SizedBox(width: 16),
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
      // 이동
      1 => AppColors.lightPink.withOpacity(0.3),
      // 먹거리
      2 => AppColors.secondary.withOpacity(0.3),
      // 관광
      3 => AppColors.primaryLight.withOpacity(0.3),
      // 휴식
      4 => AppColors.onMemoContainerDark.withOpacity(0.3),
      // 숙박
      5 => AppColors.tertiary.withOpacity(0.3),
      // 쇼핑
      6 => AppColors.lightPurple.withOpacity(0.3),
      // 액티비티
      7 => AppColors.lightGreen.withOpacity(0.3),
      // 기타
      8 => AppColors.navyOutline.withOpacity(0.3),
      // TODO: Handle this case.
      int() => throw UnimplementedError(),
    };
  }
}
