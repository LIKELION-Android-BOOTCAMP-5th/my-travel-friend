import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';

import '../../../../../core/theme/app_font.dart';
import '../../../../home_widget/domain/entities/widget_settings_entity.dart';
import '../../../../home_widget/domain/entities/widget_theme_preset.dart';
import '../../../../trip/domain/entities/trip_entity.dart';
import '../../viewmodels/home_widget/widget_setting_bloc.dart';
import '../../viewmodels/home_widget/widget_setting_event.dart';
import '../../viewmodels/home_widget/widget_setting_state.dart';

class WidgetSettingsScreen extends StatelessWidget {
  const WidgetSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WidgetSettingsBloc, WidgetSettingsState>(
      builder: (context, state) {
        final settings = state.settings;

        if (settings == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('위젯 설정')),
            body: const Center(child: Text('설정을 불러올 수 없습니다')),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('위젯 설정'),
            actions: [
              TextButton(
                onPressed: state.isSaving
                    ? null
                    : () => context.read<WidgetSettingsBloc>().add(
                        const WidgetSettingsEvent.save(),
                      ),
                child: state.isSaving
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        '저장',
                        style: AppFont.small.copyWith(color: AppColors.light),
                      ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 미리보기
                _PreviewSection(
                  settings: settings,
                  selectedTrip: state.selectedTrip,
                ),
                const SizedBox(height: 24),

                // 여행 선택 섹션
                _TripSelectionSection(
                  settings: settings,
                  trips: state.trips,
                  selectedTrip: state.selectedTrip,
                ),
                const Divider(height: 32),

                // 테마 설정 섹션
                _ThemeSection(settings: settings),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }
}

// 섹션 타이틀
class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

// 미리보기 섹션
class _PreviewSection extends StatelessWidget {
  final WidgetSettingsEntity settings;
  final TripEntity? selectedTrip;

  const _PreviewSection({required this.settings, required this.selectedTrip});

  @override
  Widget build(BuildContext context) {
    final preset = settings.themePreset;
    final tripTitle = selectedTrip?.title ?? '여행을 추가해주세요';
    String dDayText = 'D-?';

    if (selectedTrip != null) {
      final start = DateTime.parse(selectedTrip!.startAt);
      final end = DateTime.parse(selectedTrip!.endAt);

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final startDay = DateTime(start.year, start.month, start.day);
      final endDay = DateTime(end.year, end.month, end.day);

      if (today.isBefore(startDay)) {
        final diff = startDay.difference(today).inDays;
        dDayText = diff == 0 ? 'D-Day' : 'D-$diff';
      } else if (today.isAfter(endDay)) {
        final diff = today.difference(endDay).inDays;
        dDayText = 'D+$diff';
      } else {
        final diff = today.difference(startDay).inDays + 1;
        dDayText = 'Day $diff';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('미리보기'),
        const SizedBox(height: 12),

        // D-Day 위젯 미리보기
        Text(
          'D-Day 위젯',
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
        const SizedBox(height: 8),
        _DDayPreview(preset: preset, tripTitle: tripTitle, dDayText: dDayText),

        const SizedBox(height: 20),

        // 일정 위젯 미리보기
        Text(
          '오늘의 일정 위젯',
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
        const SizedBox(height: 8),
        _SchedulePreview(preset: preset, tripTitle: tripTitle),
      ],
    );
  }
}

// D-Day 미리보기 위젯
class _DDayPreview extends StatelessWidget {
  final WidgetThemePreset preset;
  final String tripTitle;
  final String dDayText;

  const _DDayPreview({
    required this.preset,
    required this.tripTitle,
    required this.dDayText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 155,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: preset.bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tripTitle,
            style: AppFont.regular.copyWith(
              color: preset.txtColor.withOpacity(0.7),
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            dDayText,
            style: AppFont.hugeBold.copyWith(
              color: preset.actColor,
              fontSize: 32,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// 일정 미리보기 위젯
class _SchedulePreview extends StatelessWidget {
  final WidgetThemePreset preset;
  final String tripTitle;

  const _SchedulePreview({required this.preset, required this.tripTitle});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateText = '${now.month}월 ${now.day}일';

    // 샘플 일정 데이터
    final sampleSchedules = [
      {'time': '09:00', 'title': '공항 출발'},
      {'time': '14:00', 'title': '호텔 체크인'},
      {'time': '18:00', 'title': '저녁 식사'},
    ];

    return Container(
      width: double.infinity,
      height: 155,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: preset.bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더
          Row(
            children: [
              Expanded(
                child: Text(
                  tripTitle,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: preset.txtColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                dateText,
                style: TextStyle(
                  fontSize: 11,
                  color: preset.txtColor.withOpacity(0.6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Divider(color: preset.txtColor.withOpacity(0.2), height: 1),
          const SizedBox(height: 8),

          // 일정 목록
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: sampleSchedules.map((schedule) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 45,
                        child: Text(
                          schedule['time']!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: preset.actColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          schedule['title']!,
                          style: TextStyle(
                            fontSize: 13,
                            color: preset.txtColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// 여행 선택 섹션
class _TripSelectionSection extends StatelessWidget {
  final WidgetSettingsEntity settings;
  final List<TripEntity> trips;
  final TripEntity? selectedTrip;

  const _TripSelectionSection({
    required this.settings,
    required this.trips,
    required this.selectedTrip,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('표시할 여행'),
        const SizedBox(height: 12),

        // 자동 선택 토글
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('자동 선택'),
          subtitle: const Text('가장 가까운 여행을 자동으로 표시'),
          value: settings.autoSelectTrip,
          onChanged: (value) {
            context.read<WidgetSettingsBloc>().add(
              WidgetSettingsEvent.toggleAutoSelect(value),
            );
          },
        ),

        // 여행 선택 드롭다운 (자동 선택 꺼졌을 때만)
        if (!settings.autoSelectTrip) ...[
          const SizedBox(height: 8),
          _TripDropdown(
            trips: trips,
            selectedTripId: settings.selectedTripId ?? selectedTrip?.id,
          ),
        ],
      ],
    );
  }
}

// 여행 드롭다운
class _TripDropdown extends StatelessWidget {
  final List<TripEntity> trips;
  final int? selectedTripId;

  const _TripDropdown({required this.trips, required this.selectedTripId});

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          '등록된 여행이 없습니다.\n여행을 추가하면 위젯에 표시할 수 있어요.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          isExpanded: true,
          value: selectedTripId,
          hint: const Text('여행을 선택하세요'),
          items: trips.map((trip) {
            final startDate = DateTime.parse(trip.startAt);
            final dateStr = '${startDate.month}/${startDate.day}';

            return DropdownMenuItem<int>(
              value: trip.id,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      trip.title ?? '제목 없음',
                      overflow: TextOverflow.ellipsis,
                      style: AppFont.regular,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    dateStr,
                    style: TextStyle(color: AppColors.darkerGray, fontSize: 13),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (tripId) {
            if (tripId != null) {
              context.read<WidgetSettingsBloc>().add(
                WidgetSettingsEvent.selectTrip(tripId),
              );
            }
          },
        ),
      ),
    );
  }
}

// 테마 설정 섹션
class _ThemeSection extends StatelessWidget {
  final WidgetSettingsEntity settings;

  const _ThemeSection({required this.settings});

  @override
  Widget build(BuildContext context) {
    final selectedPreset = settings.themePreset;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('테마'),
        const SizedBox(height: 12),

        // 시스템 테마 토글
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('시스템 테마 자동 전환'),
          subtitle: const Text('다크 모드일 때 자동으로 어두운 테마 적용'),
          value: settings.useSystemTheme,
          onChanged: (value) {
            context.read<WidgetSettingsBloc>().add(
              WidgetSettingsEvent.toggleSystemTheme(value),
            );
          },
        ),
        const SizedBox(height: 16),

        // 테마 그리드
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: WidgetThemePreset.values.length,
          itemBuilder: (context, index) {
            final preset = WidgetThemePreset.values[index];
            final isSelected = preset.name == selectedPreset.name;

            return _ThemeCard(
              preset: preset,
              isSelected: isSelected,
              onTap: () {
                context.read<WidgetSettingsBloc>().add(
                  WidgetSettingsEvent.changeTheme(preset),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

// 테마 카드
class _ThemeCard extends StatelessWidget {
  final WidgetThemePreset preset;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeCard({
    required this.preset,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: preset.bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
            width: isSelected ? 3 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            // 테마 이름
            Positioned(
              left: 12,
              top: 12,
              child: Text(
                preset.name,
                style: TextStyle(
                  color: preset.txtColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // 액센트 색상 원
            Positioned(
              right: 12,
              bottom: 12,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: preset.actColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'D',
                    style: TextStyle(
                      color: preset.actColor.computeLuminance() > 0.5
                          ? Colors.black
                          : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // 선택 체크
            if (isSelected)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
