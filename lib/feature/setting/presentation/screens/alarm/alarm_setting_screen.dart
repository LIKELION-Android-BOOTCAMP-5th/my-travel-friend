import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/theme/app_font.dart';

import '../../../../../core/widget/app_bar.dart';
import '../../../../../core/widget/button.dart';
import '../../../../../theme/app_colors.dart';
import '../../../../../theme/app_icon.dart';
import '../../viewmodels/alarm/alarm_setting_bloc.dart';
import '../../viewmodels/alarm/alarm_setting_event.dart';
import '../../viewmodels/alarm/alarm_setting_state.dart';
import '../../widgets/alarm_setting_box.dart';

// [이재은] 알림 설정 화면
class AlarmSettingScreen extends StatelessWidget {
  const AlarmSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
      appBar: CustomButtonAppBar(
        title: '푸시 알림 설정',
        leading: Button(
          width: 40,
          height: 40,
          icon: Icon(AppIcon.back),
          contentColor: isDark ? colorScheme.onSurface : AppColors.light,
          borderRadius: 20,
          onTap: () => context.pop(),
        ),
      ),
      body: BlocBuilder<AlarmSettingBloc, AlarmSettingState>(
        builder: (context, state) {
          if (state.pageState == AlarmSettingPageState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.pageState == AlarmSettingPageState.error) {
            return Center(child: Text(state.message ?? '오류가 발생했습니다'));
          }

          return _buildSettingList(context, state);
        },
      ),
    );
  }

  // 설정 화면
  Widget _buildSettingList(BuildContext context, AlarmSettingState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          _buildEntire(
            context: context,
            child: AlarmSettingBox(
              type: '전체 알림',
              value: state.entireAlarm,
              onChanged: (value) => context.read<AlarmSettingBloc>().add(
                AlarmSettingEvent.toggleEntireAlarm(value: value),
              ),
              isLast: true,
            ),
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildItem(
                  context: context,
                  type: '여행 초대',
                  value: state.tripRequest,
                  onChanged: (value) => context.read<AlarmSettingBloc>().add(
                    AlarmSettingEvent.toggleIndividualAlarm(
                      type: 'tripRequest',
                      value: value,
                    ),
                  ),
                ),
                _buildItem(
                  context: context,
                  type: '친구 요청',
                  value: state.friendRequest,
                  onChanged: (value) => context.read<AlarmSettingBloc>().add(
                    AlarmSettingEvent.toggleIndividualAlarm(
                      type: 'friendRequest',
                      value: value,
                    ),
                  ),
                ),
                _buildItem(
                  context: context,
                  type: '새 친구 관계',
                  value: state.newFriend,
                  onChanged: (value) => context.read<AlarmSettingBloc>().add(
                    AlarmSettingEvent.toggleIndividualAlarm(
                      type: 'newFriend',
                      value: value,
                    ),
                  ),
                ),
                _buildItem(
                  context: context,
                  type: '스케줄 추가',
                  value: state.scheduleAdded,
                  onChanged: (value) => context.read<AlarmSettingBloc>().add(
                    AlarmSettingEvent.toggleIndividualAlarm(
                      type: 'scheduleAdded',
                      value: value,
                    ),
                  ),
                ),
                _buildItem(
                  context: context,
                  type: '스케줄 수정',
                  value: state.scheduleEdited,
                  onChanged: (value) => context.read<AlarmSettingBloc>().add(
                    AlarmSettingEvent.toggleIndividualAlarm(
                      type: 'scheduleEdited',
                      value: value,
                    ),
                  ),
                ),
                _buildItem(
                  context: context,
                  type: '스케줄 삭제',
                  value: state.scheduleDeleted,
                  onChanged: (value) => context.read<AlarmSettingBloc>().add(
                    AlarmSettingEvent.toggleIndividualAlarm(
                      type: 'scheduleDeleted',
                      value: value,
                    ),
                  ),
                ),
                _buildItem(
                  context: context,
                  type: '톡톡 메세지',
                  value: state.talkMessage,
                  onChanged: (value) => context.read<AlarmSettingBloc>().add(
                    AlarmSettingEvent.toggleIndividualAlarm(
                      type: 'talkMessage',
                      value: value,
                    ),
                  ),
                ),
                _buildItem(
                  context: context,
                  type: 'D-Day',
                  value: state.dDay,
                  isLast: true,
                  onChanged: (value) => context.read<AlarmSettingBloc>().add(
                    AlarmSettingEvent.toggleIndividualAlarm(
                      type: 'dDay',
                      value: value,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
            child: Text(
              "설정을 변경하면 즉시 적용됩니다",
              style: AppFont.small.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 전체 알림용 카드 컨테이너
  Widget _buildEntire({required BuildContext context, required Widget child}) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  // 개별 아이템 + Divider(마지막이 아닐때만)
  Widget _buildItem({
    required BuildContext context,
    required String type,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool isLast = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Column(
      children: [
        AlarmSettingBox(
          type: type,
          value: value,
          onChanged: onChanged,
          isLast: isLast,
        ),
        if (!isLast)
          Divider(
            height: 0.5,
            color: colorScheme.outlineVariant.withOpacity(0.3),
          ),
      ],
    );
  }
}
