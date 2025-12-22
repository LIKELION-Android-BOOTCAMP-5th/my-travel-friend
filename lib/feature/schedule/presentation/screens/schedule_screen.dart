import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';
import 'package:my_travel_friend/feature/schedule/presentation/viewmodels/schedule/schedule_state.dart';
import 'package:my_travel_friend/feature/schedule/presentation/widgets/schedule_card.dart';
import 'package:my_travel_friend/feature/schedule/presentation/widgets/schedule_tap_button.dart';

import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/floating_button.dart';
import '../../../trip/domain/entities/trip_entity.dart';
import '../coachmarks/schedule_coach_mark.dart';
import '../viewmodels/schedule/schedule_bloc.dart';
import '../viewmodels/schedule/schedule_event.dart';
import '../widgets/empty_schedule_care.dart';

class ScheduleScreen extends StatefulWidget {
  final int tripId;

  const ScheduleScreen({super.key, required this.tripId});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final ScrollController _scroll = ScrollController();

  late final ScheduleCoachMark _coachMark;

  @override
  void initState() {
    super.initState();

    _coachMark = ScheduleCoachMark();

    // 무한스크롤
    _scroll.addListener(() {
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 100) {
        context.read<ScheduleBloc>().add(
          ScheduleEvent.loadMore(tripId: widget.tripId),
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          _coachMark.show(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
      floatingActionButton: FloatingButton(
        key: _coachMark.fabKey,
        icon: const Icon(AppIcon.plus),
        onPressed: () {
          context.read<ScheduleBloc>().add(
            const ScheduleEvent.navigateToCreate(),
          );
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          final bloc = context.read<ScheduleBloc>();

          final isDateTab = state.viewMode == ScheduleFilterType.date;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // 1) 상단 모드 탭 (일자별 / 카테고리별)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ScheduleTapButton(
                          key: _coachMark.dateTabKey,
                          label: "일자별",
                          isSelected: isDateTab,
                          onTap: () =>
                              bloc.add(const ScheduleEvent.switchToDateMode()),
                          height: 50,
                          horizontalPadding: 22,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ScheduleTapButton(
                          key: _coachMark.categoryTabKey,
                          label: "카테고리별",
                          isSelected: !isDateTab,
                          onTap: () => bloc.add(
                            const ScheduleEvent.switchToCategoryMode(),
                          ),
                          height: 50,
                          horizontalPadding: 22,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // 2) 하위 탭 (전체 / 날짜 목록 / 카테고리 목록)
                SizedBox(
                  key: _coachMark.filterKey,
                  height: 50,

                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(width: 8),

                      ScheduleTapButton(
                        label: "전체",
                        isSelected:
                            state.selectedDate == null &&
                            state.selectedCategoryId == null,
                        onTap: () =>
                            bloc.add(const ScheduleEvent.clearFilter()),
                        height: 32,
                        horizontalPadding: 20,
                      ),

                      const SizedBox(width: 8),

                      if (state.viewMode == ScheduleFilterType.date &&
                          state.trip != null)
                        ...buildTripDates(state.trip!).map(
                          (date) => Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: ScheduleTapButton(
                              label: formatDateLabel(date), // 2월 10일
                              isSelected: state.selectedDate == date,
                              onTap: () => bloc.add(
                                ScheduleEvent.selectDate(date: date),
                              ),
                              height: 32,
                              horizontalPadding: 20,
                            ),
                          ),
                        ),

                      if (state.viewMode == ScheduleFilterType.category)
                        ...state.categories.map(
                          (category) => Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: ScheduleTapButton(
                              label: category.content,
                              isSelected:
                                  state.selectedCategoryId == category.id,
                              onTap: () => bloc.add(
                                ScheduleEvent.selectCategory(
                                  categoryId: category.id,
                                ),
                              ),
                              height: 32,
                              horizontalPadding: 20,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // 3) 본문 내용
                Expanded(
                  key: _coachMark.listKey,
                  child: state.visibleSchedules.isEmpty
                      ? Center(
                          child: EmptyScheduleCard(
                            onAdd: () => bloc.add(
                              const ScheduleEvent.navigateToCreate(),
                            ),
                          ),
                        )
                      : ListView.builder(
                          controller: _scroll,
                          padding: const EdgeInsets.only(bottom: 80),
                          itemCount: state.visibleSchedules.length,
                          itemBuilder: (context, index) {
                            final s = state.visibleSchedules[index];
                            final members =
                                state.scheduleMembersMap[s.id] ?? [];

                            final profileImages = members
                                .map((u) => u.profileImg)
                                .whereType<String>()
                                .where((img) => img.isNotEmpty && img != 'null')
                                .toList();
                            final category = state.categoryMap[s.categoryId];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: ScheduleCard(
                                title: s.title,
                                dateTime: formatScheduleDateTime(s.date),
                                place: s.place ?? "",
                                tagName: category!.content,
                                profileImages: profileImages,
                                memo: s.description,
                                onEdit: () => bloc.add(
                                  ScheduleEvent.navigateToEdit(schedule: s),
                                ),
                                onDelete: () => bloc.add(
                                  ScheduleEvent.deleteSchedule(s.id!),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<String> buildTripDates(TripEntity trip) {
  final start = DateTime.parse(trip.startAt);
  final end = DateTime.parse(trip.endAt);

  final dates = <String>[];
  var current = start;

  while (!current.isAfter(end)) {
    dates.add(
      current.toIso8601String().substring(0, 10), // yyyy-MM-dd
    );
    current = current.add(const Duration(days: 1));
  }

  return dates;
}

String formatDateLabel(String date) {
  final dt = DateTime.parse(date);
  return '${dt.month}월 ${dt.day}일';
}
