import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodels/trip_home/trip_home_bloc.dart';
import '../viewmodels/trip_home/trip_home_event.dart';
import '../viewmodels/trip_home/trip_home_state.dart';

class TripHomeScreen extends StatelessWidget {
  const TripHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CrewSummaryCard(),
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

                  _TripCalendar(),
                  const SizedBox(height: 16),

                  const _ScheduleSection(),
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
  @override
  Widget build(BuildContext context) {
    final state = context.watch<TripHomeBloc>().state;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: _cardDeco,
      child: Row(
        children: [
          const Icon(Icons.group, color: Colors.blue),
          const SizedBox(width: 8),
          Text(
            '크루 멤버 (${state.crewMembers.length}명)',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),

          // 친구 초대
          IconButton(
            icon: const Icon(Icons.person_add_alt),
            onPressed: () {
              context.read<TripHomeBloc>().add(
                const TripHomeEvent.openInvite(),
              );
            },
          ),

          // 펼치기/접기
          IconButton(
            icon: Icon(
              state.isCrewExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
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

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDeco,
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
  @override
  State<_TripCalendar> createState() => _TripCalendarState();
}

class _TripCalendarState extends State<_TripCalendar> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    final page = context.read<TripHomeBloc>().state.currentCalendarPage;
    _controller = PageController(initialPage: page);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TripHomeBloc>().state;
    final pages = state.calendarPages;

    if (pages.isEmpty) {
      return _emptyCalendar();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDeco,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('주간 캘린더', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          SizedBox(
            height: 132, // 최대 2줄
            child: PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                context.read<TripHomeBloc>().add(
                  TripHomeEvent.changeCalendarPage(pageIndex: index),
                );
              },
              itemBuilder: (context, pageIndex) {
                final page = pages[pageIndex];

                final firstRow = page.take(7).toList();
                final secondRow = page.skip(7).take(7).toList();

                final hasSecondRow = secondRow.any((d) => d != null);

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: firstRow
                          .map((d) => _DateCellNullable(date: d))
                          .toList(),
                    ),

                    if (hasSecondRow) ...[
                      const SizedBox(height: 10),
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
        ],
      ),
    );
  }

  Widget _emptyCalendar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDeco,
      child: const Text('캘린더 정보를 불러오지 못했습니다'),
    );
  }
}

class _DateCell extends StatelessWidget {
  final DateTime date;

  const _DateCell({required this.date});

  @override
  Widget build(BuildContext context) {
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
        ? Colors.blue
        : isDisabled
        ? Colors.grey.shade300
        : Colors.transparent;

    final textColor = isSelected
        ? Colors.white
        : isDisabled
        ? Colors.grey.shade600
        : Colors.black;

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
            color: isSelected ? Colors.blue : Colors.grey.shade300,
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
    if (date == null) {
      return Container(
        width: 42,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
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
  const _ScheduleSection();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TripHomeBloc>().state;
    final selected = state.selectedDate;

    final title = selected == null
        ? '일정'
        : '${selected.month}월 ${selected.day}일 일정';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDeco,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          if (state.schedulesForSelectedDate.isEmpty)
            const Center(child: Text('이 날짜에는 일정이 없습니다')),

          ...state.schedulesForSelectedDate.map((s) {
            final dt = DateTime.tryParse(s.date ?? '');
            final hhmm = (dt == null)
                ? '--:--'
                : '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

            final hasPlace = s.place != null && s.place!.trim().isNotEmpty;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ⏰ 시간
                  SizedBox(
                    width: 52,
                    child: Text(
                      hhmm,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 제목
                        Text(
                          s.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),

                        // 장소 (있을 때만)
                        if (hasPlace) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.place,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  s.place!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: _cardDeco,
      child: Row(
        children: [
          const Icon(Icons.language, color: Colors.blue),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              '쓸만한 현지 실생활 표현',
              style: TextStyle(fontWeight: FontWeight.bold),
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

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDeco,
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

    return Positioned.fill(
      child: Material(
        color: Colors.black45,
        child: Center(
          child: Container(
            height: 420,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(16),
            decoration: _cardDeco,
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
                      debugPrint(
                        '👤 invite friend: ${user.nickname}, profileImg = "${user.profileImg}"',
                      );
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            // 프로필 이미지
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage:
                                  (user.profileImg != null &&
                                      user.profileImg!.trim().isNotEmpty)
                                  ? NetworkImage(user.profileImg!)
                                  : null,
                              child:
                                  (user.profileImg == null ||
                                      user.profileImg!.trim().isEmpty)
                                  ? const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    )
                                  : null,
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
                                backgroundColor: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                              ),
                              onPressed: () {
                                // TODO: 초대 이벤트
                              },
                              child: const Text(
                                '초대하기',
                                style: TextStyle(color: Colors.white),
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

final _cardDeco = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ],
);
