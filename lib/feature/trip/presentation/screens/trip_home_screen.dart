import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';
import 'package:my_travel_friend/core/theme/app_font.dart';
import 'package:my_travel_friend/core/theme/app_icon.dart';
import 'package:my_travel_friend/feature/trip/presentation/screens/trip_shell_scaffold.dart';

import '../../../../core/widget/toast_pop.dart';
import '../viewmodels/trip_home/trip_home_bloc.dart';
import '../viewmodels/trip_home/trip_home_event.dart';
import '../viewmodels/trip_home/trip_home_state.dart';
import '../viewmodels/trip_request/trip_request_bloc.dart';
import '../viewmodels/trip_request/trip_request_event.dart';

class TripHomeScreen extends StatefulWidget {
  const TripHomeScreen({super.key});

  @override
  State<TripHomeScreen> createState() => _TripHomeScreenState();
}

class _TripHomeScreenState extends State<TripHomeScreen> {
  TripShellScaffoldState? get _shellState =>
      context.findAncestorStateOfType<TripShellScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return BlocBuilder<TripHomeBloc, TripHomeState>(
      builder: (context, state) {
        if (state.pageState == TripHomePageState.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.pageState == TripHomePageState.error) {
          return Center(child: Text(state.message ?? '에러가 발생했습니다'));
        }

        return Stack(
          children: [
            Scaffold(
              backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
              body: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CrewSummaryCard(
                      key: _shellState?.crewKey,
                      inviteKey: _shellState?.inviteKey,
                    ),
                    const SizedBox(height: 12),

                    AnimatedSize(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: ClipRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          heightFactor: state.isCrewExpanded ? 1.0 : 0.0,
                          child: const _CrewMemberList(),
                        ),
                      ),
                    ),

                    if (state.isCrewExpanded) const SizedBox(height: 16),

                    _TripCalendar(key: _shellState?.calendarKey),
                    const SizedBox(height: 16),

                    _ScheduleSection(key: _shellState?.scheduleKey),
                    const SizedBox(height: 16),

                    if (state.usefulPhrases.isNotEmpty) ...[
                      _UsefulPhraseHeader(),
                      const SizedBox(height: 12),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        child: ClipRect(
                          child: Align(
                            alignment: Alignment.topCenter,
                            heightFactor: state.isUsefulPhraseExpanded
                                ? 1.0
                                : 0.0,
                            child: const _UsefulPhraseList(),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            if (state.isInviteMode) const _InviteFriendPopup(),
          ],
        );
      },
    );
  }
}

// =======================
// Crew
// =======================
class _CrewSummaryCard extends StatelessWidget {
  final GlobalKey? inviteKey;

  const _CrewSummaryCard({super.key, this.inviteKey});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TripHomeBloc>().state;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: _cardDeco(colorScheme),
      child: Row(
        children: [
          Icon(AppIcon.crews, color: colorScheme.primary, size: 15),
          const SizedBox(width: 12),
          Text(
            '크루 멤버 (${state.crewMembers.length}명)',
            style: AppFont.regularBold.copyWith(
              color: isDark ? AppColors.light : AppColors.dark,
            ),
          ),
          const Spacer(),

          // 친구 초대
          IconButton(
            key: inviteKey,
            icon: Icon(
              AppIcon.invite,
              color: isDark ? AppColors.light : AppColors.dark,
              size: 15,
            ),
            onPressed: () {
              context.read<TripHomeBloc>().add(
                const TripHomeEvent.openInvite(),
              );
            },
          ),

          // 펼치기/접기
          IconButton(
            icon: Icon(
              state.isCrewExpanded ? AppIcon.closeUp : AppIcon.openDown,
              size: 15,
            ),
            onPressed: () {
              context.read<TripHomeBloc>().add(
                const TripHomeEvent.toggleCrew(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CrewMemberList extends StatelessWidget {
  const _CrewMemberList();

  @override
  Widget build(BuildContext context) {
    final members = context.watch<TripHomeBloc>().state.crewMembers;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDeco(colorScheme),
      child: Column(
        children: members.map((user) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      (user.profileImg != null &&
                          user.profileImg!.trim().isNotEmpty)
                      ? NetworkImage(user.profileImg!)
                      : null,
                  child:
                      (user.profileImg == null ||
                          user.profileImg!.trim().isEmpty)
                      ? const Icon(Icons.person)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(user.nickname ?? '')),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

// =======================
// Calendar (여행기간 제한)
// =======================
class _TripCalendar extends StatefulWidget {
  const _TripCalendar({super.key});

  @override
  State<_TripCalendar> createState() => _TripCalendarState();
}

class _TripCalendarState extends State<_TripCalendar>
    with TickerProviderStateMixin {
  late final PageController _controller;

  bool _hasSecondRow = false;

  static const double _rowHeight = 56.0;
  static const double _rowSpacing = 10.0;

  double get _calendarHeight =>
      _hasSecondRow ? _rowHeight * 2 + _rowSpacing : _rowHeight;

  @override
  void initState() {
    super.initState();

    final state = context.read<TripHomeBloc>().state;
    _controller = PageController(initialPage: state.currentCalendarPage);

    if (state.calendarPages.isNotEmpty) {
      _updateRowState(state.calendarPages[state.currentCalendarPage]);
    }
  }

  void _updateRowState(List<DateTime?> page) {
    final secondRow = page.skip(7).take(7);
    final hasSecond = secondRow.any((d) => d != null);

    if (_hasSecondRow != hasSecond) {
      setState(() {
        _hasSecondRow = hasSecond;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TripHomeBloc>().state;
    final pages = state.calendarPages;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    if (pages.isEmpty) {
      return _emptyCalendar();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDeco(colorScheme),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더
          Row(
            children: [
              Icon(AppIcon.calendar, color: colorScheme.primary, size: 15),
              const SizedBox(width: 12),
              Text(
                '주간 캘린더',
                style: AppFont.regularBold.copyWith(
                  color: isDark ? AppColors.light : AppColors.dark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 캘린더
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: SizedBox(
              height: _calendarHeight,
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  context.read<TripHomeBloc>().add(
                    TripHomeEvent.changeCalendarPage(pageIndex: index),
                  );
                  _updateRowState(pages[index]);
                },
                itemBuilder: (context, pageIndex) {
                  final page = pages[pageIndex];

                  final firstRow = page.take(7).toList();
                  final secondRow = page.skip(7).take(7).toList();

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: firstRow
                            .map((d) => _DateCellNullable(date: d))
                            .toList(),
                      ),

                      if (_hasSecondRow) ...[
                        const SizedBox(height: _rowSpacing),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: secondRow
                              .map((d) => _DateCellNullable(date: d))
                              .toList(),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyCalendar() {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDeco(colorScheme),
      child: const Text('캘린더 정보를 불러오지 못했습니다'),
    );
  }
}

class _DateCell extends StatelessWidget {
  final DateTime date;

  const _DateCell({required this.date});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    final state = context.watch<TripHomeBloc>().state;
    final selected = state.selectedDate;

    final start = state.tripStartDate == null
        ? null
        : _onlyDate(state.tripStartDate!);
    final end = state.tripEndDate == null
        ? null
        : _onlyDate(state.tripEndDate!);
    final d = _onlyDate(date);

    final isSelected =
        selected != null &&
        d.year == selected.year &&
        d.month == selected.month &&
        d.day == selected.day;

    final isDisabled =
        (start != null && d.isBefore(start)) || (end != null && d.isAfter(end));

    final bgColor = isSelected
        ? colorScheme.primary
        : isDisabled
        ? isDark
              ? AppColors.navy
              : AppColors.darkerGray
        : Colors.transparent;

    final textColor = isSelected
        ? AppColors.light
        : isDisabled
        ? Colors.grey.shade600
        : colorScheme.onSurfaceVariant;

    return GestureDetector(
      onTap: isDisabled
          ? null
          : () {
              context.read<TripHomeBloc>().add(
                TripHomeEvent.selectDate(date: d),
              );
            },
      child: Container(
        width: 42,
        height: 56,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? colorScheme.primary : Colors.grey.shade300,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${d.day}',
              style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
            ),
            const SizedBox(height: 2),
            Text(
              _weekdayKor(d.weekday),
              style: TextStyle(fontSize: 11, color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  DateTime _onlyDate(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  String _weekdayKor(int w) {
    switch (w) {
      case DateTime.monday:
        return '월';
      case DateTime.tuesday:
        return '화';
      case DateTime.wednesday:
        return '수';
      case DateTime.thursday:
        return '목';
      case DateTime.friday:
        return '금';
      case DateTime.saturday:
        return '토';
      case DateTime.sunday:
        return '일';
      default:
        return '';
    }
  }
}

class _DateCellNullable extends StatelessWidget {
  final DateTime? date;

  const _DateCellNullable({required this.date});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    if (date == null) {
      return Container(
        width: 42,
        height: 56,
        decoration: BoxDecoration(
          color: isDark ? AppColors.navy : AppColors.darkerGray,
          borderRadius: BorderRadius.circular(12),
        ),
      );
    }

    return _DateCell(date: date!);
  }
}

// =======================
// Schedule
// =======================
class _ScheduleSection extends StatelessWidget {
  const _ScheduleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TripHomeBloc>().state;
    final selected = state.selectedDate;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    final title = selected == null
        ? '일정'
        : '${selected.month}월 ${selected.day}일 일정';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDeco(colorScheme),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppFont.regularBold),
          const SizedBox(height: 12),

          if (state.schedulesForSelectedDate.isEmpty)
            Center(child: Text('이 날짜에는 일정이 없습니다', style: AppFont.regular)),

          ...state.schedulesForSelectedDate.map((s) {
            final raw = DateTime.tryParse(s.date ?? '');
            final local = raw?.toLocal();

            final hhmm = (local == null)
                ? '--:--'
                : '${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';

            final hasPlace = s.place != null && s.place!.trim().isNotEmpty;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 52,
                    child: Text(hhmm, style: AppFont.regular),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 제목
                        Text(
                          s.title,
                          style: AppFont.regularBold.copyWith(
                            color: isDark ? AppColors.light : AppColors.dark,
                          ),
                        ),

                        // 장소 (있을 때만)
                        if (hasPlace) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                AppIcon.mapPin,
                                size: 14,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  s.place!,
                                  style: AppFont.small.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// =======================
// Useful Phrases (토글)
// =======================
class _UsefulPhraseHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<TripHomeBloc>().state;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: _cardDeco(colorScheme),
      child: Row(
        children: [
          Icon(AppIcon.phrase, color: colorScheme.primary, size: 15),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '쓸만한 현지 실생활 표현',
              style: AppFont.regularBold.copyWith(
                color: isDark ? AppColors.light : AppColors.dark,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              state.isUsefulPhraseExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
            ),
            onPressed: () {
              context.read<TripHomeBloc>().add(
                const TripHomeEvent.toggleUsefulPhrase(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _UsefulPhraseList extends StatelessWidget {
  const _UsefulPhraseList();

  @override
  Widget build(BuildContext context) {
    final phrases = context.watch<TripHomeBloc>().state.usefulPhrases;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDeco(colorScheme),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: phrases.map((p) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              '${p.native} (${p.korean})\n${p.mean}',
              style: const TextStyle(height: 1.3),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// =======================
// Invite Popup
// =======================
class _InviteFriendPopup extends StatelessWidget {
  const _InviteFriendPopup();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TripHomeBloc>().state;
    final colorScheme = Theme.of(context).colorScheme;
    return Positioned.fill(
      child: Material(
        color: AppColors.dark,
        child: Center(
          child: Container(
            height: 420,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(16),
            decoration: _cardDeco(colorScheme),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      '친구 목록',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        context.read<TripHomeBloc>().add(
                          const TripHomeEvent.closeInvite(),
                        );
                      },
                    ),
                  ],
                ),
                const Divider(),

                Expanded(
                  child: ListView.builder(
                    itemCount: state.friendCandidates.length,
                    itemBuilder: (context, index) {
                      final user = state.friendCandidates[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            // 프로필 이미지
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage:
                                  (user.profileImg != null &&
                                      user.profileImg!.trim().isNotEmpty)
                                  ? NetworkImage(user.profileImg!)
                                  : AssetImage(
                                      'assets/images/profile_hearty.png',
                                    ),
                            ),

                            const SizedBox(width: 12),

                            // 이름
                            Expanded(
                              child: Text(
                                user.nickname ?? '',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            // 초대 버튼
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                              ),
                              onPressed: () {
                                final tripState = context
                                    .read<TripHomeBloc>()
                                    .state;

                                context.read<TripRequestBloc>().add(
                                  TripRequestEvent.createTripRequest(
                                    requestId: tripState.myId!,
                                    targetId: user.id!,
                                    tripId: tripState.tripId!,
                                  ),
                                );

                                context.read<TripHomeBloc>().add(
                                  const TripHomeEvent.closeInvite(),
                                );
                                ToastPop.show('여행에 초대했습니다');
                              },

                              child: Text(
                                '초대하기',
                                style: AppFont.regular.copyWith(
                                  color: AppColors.light,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

BoxDecoration _cardDeco(ColorScheme colorScheme) {
  return BoxDecoration(
    color: colorScheme.surfaceContainerHighest,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
