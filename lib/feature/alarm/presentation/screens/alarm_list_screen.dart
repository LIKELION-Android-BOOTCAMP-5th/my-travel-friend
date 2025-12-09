import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/button.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_font.dart';
import '../../../../theme/app_icon.dart';
import '../viewmodels/alarm_bloc.dart';
import '../viewmodels/alarm_event.dart';
import '../viewmodels/alarm_state.dart';
import '../widgets/alarm_box.dart';

// [이재은] 다이어리 탭 화면
// - 알림 리스트 확인 가능
// - 리스트 내 박스 클릭 시 해당 알람 관련 페이지로 이동

class AlarmListScreen extends StatefulWidget {
  final int userId;

  const AlarmListScreen({super.key, required this.userId});

  @override
  State<AlarmListScreen> createState() => _AlarmListScreenState();
}

class _AlarmListScreenState extends State<AlarmListScreen> {
  // 무한 스크롤을 위한 컨트롤러
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  // 스크롤 이벤트 핸들러
  // - 스크롤이 하단에 도달하면 LoadMore 이벤트 발생
  // - 실제 조건 체크는 Bloc에서
  void _onScroll() {
    if (_isBottom) {
      context.read<AlarmBloc>().add(AlarmEvent.loadMore());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll - 100);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
        appBar: CustomButtonAppBar(
          title: '알림',
          leading: Button(
            width: 40,
            height: 40,
            icon: Icon(AppIcon.back),
            contentColor: isDark ? colorScheme.onSurface : AppColors.light,
            borderRadius: 20,
            onTap: () => context.pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 16),
              Expanded(child: _buildAlarmList(context)),
            ],
          ),
        ),
      ),
    );
  }

  // 헤더 읽지 않은 알림 갯수 + 전체 읽음 버튼
  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<AlarmBloc, AlarmState>(
      buildWhen: (prev, curr) => prev.alarms != curr.alarms,
      builder: (context, state) {
        final unreadCount = state.alarms
            .where((alarm) => !alarm.isChecked)
            .length;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 읽지 않은 알림 갯수
            Row(
              children: [
                Icon(AppIcon.alarm, color: colorScheme.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  '읽지 않은 알림 $unreadCount개',
                  style: AppFont.regular.copyWith(color: colorScheme.onSurface),
                ),
              ],
            ),

            // 전체 읽음 버튼
            if (unreadCount > 0)
              GestureDetector(
                onTap: () {
                  context.read<AlarmBloc>().add(const AlarmEvent.checkAlarms());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '모두 읽음',
                    style: AppFont.small.copyWith(color: colorScheme.primary),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  // 알림 리스트
  Widget _buildAlarmList(BuildContext context) {
    return BlocBuilder<AlarmBloc, AlarmState>(
      buildWhen: (prev, curr) =>
          prev.alarms != curr.alarms ||
          prev.hasMore != curr.hasMore ||
          prev.pageState != curr.pageState,
      builder: (context, state) {
        final alarms = state.alarms;

        if (state.pageState == AlarmPageState.initial) {
          return const SizedBox.shrink();
        }

        if (alarms.isEmpty) {
          return _buildEmptyView(context);
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<AlarmBloc>().add(
              AlarmEvent.getAlarms(userId: widget.userId),
            );
          },
          child: ListView.separated(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: alarms.length + (state.hasMore ? 1 : 0),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              // 로딩 인디케이터
              if (index >= alarms.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final alarm = alarms[index];

              return GestureDetector(
                onTap: () => _onAlarmTap(alarm),
                child: AlarmBox(alarm: alarm),
              );
            },
          ),
        );
      },
    );
  }

  // 알림 없을 때 (가입 초기) 빈 화면
  Widget _buildEmptyView(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AppIcon.alarm,
            size: 64,
            color: colorScheme.onSurfaceVariant.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            '받은 알림이 없습니다\n새로운 소식이 오면 여기에 표시돼요',
            style: AppFont.regular.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // 알림 클릭 시 처리
  void _onAlarmTap(alarm) {
    // 읽지 않은 알림이면 읽음 처리
    if (!alarm.isChecked && alarm.id != null) {
      context.read<AlarmBloc>().add(
        AlarmEvent.checkAnAlarm(alarmId: alarm.id!),
      );
    }

    // 알림 타입에 따라 해당 페이지로 이동
    _navigateByAlarmType(alarm);
  }

  // 알림 타입별 네비게이션
  void _navigateByAlarmType(alarm) {
    final data = alarm.data;
    if (data == null) return;

    switch (alarm.type) {
      case 'TRIP_REQUEST':
        final tripId = data['trip_id'];
        if (tripId != null) {
          // 내가 받은 여행 페이지로 이동
        }
        break;

      case 'FRIEND_REQUEST':
        // 친구 요청 페이지로 이동
        break;

      case 'NEW_FRIEND':
        // 친구 목록 페이지로 이동
        break;

      case 'SCHEDULE_EDITED':
      case 'SCHEDULE_ADDED':
      case 'SCHEDULE_DELETED':
        final tripId = data['trip_id'];
        if (tripId != null) {
          // 해당 일정 페이지로 이동
        }
        break;

      case 'TALK_MESSAGE':
        final tripId = data['trip_id'];
        if (tripId != null) {
          // 톡톡 페이지로 이동
        }
        break;

      case 'D_DAY':
        final tripId = data['trip_id'];
        if (tripId != null) {
          // 해당 여행 홈으로 이동
        }
        break;

      default:
        break;
    }
  }
}
