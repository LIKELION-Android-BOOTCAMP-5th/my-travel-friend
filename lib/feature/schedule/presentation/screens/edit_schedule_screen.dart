import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/theme/app_icon.dart';
import 'package:my_travel_friend/core/widget/button.dart';

import '../../../../../core/widget/text_box.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/pop_up_box.dart';
import '../../domain/entities/schedule_entity.dart';
import '../viewmodels/edit_schedule/edit_schedule_bloc.dart';
import '../viewmodels/edit_schedule/edit_schedule_event.dart';
import '../viewmodels/edit_schedule/edit_schedule_state.dart';
import '../viewmodels/map_search/map_search_state.dart';

class EditScheduleScreen extends StatefulWidget {
  final ScheduleEntity schedule;

  const EditScheduleScreen({super.key, required this.schedule});

  @override
  State<EditScheduleScreen> createState() => _EditScheduleScreenState();
}

class _EditScheduleScreenState extends State<EditScheduleScreen> {
  final _titleController = TextEditingController();
  final _memoController = TextEditingController();
  final _placeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final s = widget.schedule;

    _titleController.text = s.title;
    _memoController.text = s.description ?? '';
    _placeController.text = s.place ?? '';

    context.read<EditScheduleBloc>().add(
      EditScheduleEvent.initialized(schedule: s),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _memoController.dispose();
    _placeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditScheduleBloc, EditScheduleState>(
      listenWhen: (prev, curr) => prev.actionType != curr.actionType,
      listener: (context, state) async {
        if (state.actionType == 'exit_confirm') {
          final shouldExit = await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (_) => PopUpBox(
              title: "수정을 취소할까요?",
              message: "지금 나가면 수정한 내용이 적용되지 않아요.",
              leftText: "취소",
              rightText: "확인",
              onRight: () => Navigator.of(context).pop(true),
            ),
          );

          if (shouldExit == true && context.mounted) {
            context.read<EditScheduleBloc>().add(
              const EditScheduleEvent.exitConfirmed(),
            );
          }

          context.read<EditScheduleBloc>().add(
            const EditScheduleEvent.clearMessage(),
          );

          return; // 🔥 여기서 반드시 종료
        }
        // 뒤로가기
        if (state.actionType == 'pop') {
          Navigator.of(context).pop(false);
        }

        // 컨트롤러 동기화 (초기값 / 지도 선택 등)
        if (_titleController.text != state.title) {
          _titleController.text = state.title ?? '';
        }
        if (_memoController.text != state.description) {
          _memoController.text = state.description ?? '';
        }
        if (_placeController.text != state.place) {
          _placeController.text = state.place ?? '';
        }
        // 장소만 동기화 (지도 선택 등)
        if (_placeController.text != state.place) {
          _placeController.text = state.place ?? '';
        }

        // 수정 성공
        if (state.pageState == EditSchedulePageState.success) {
          Navigator.of(context).pop(true);
        }
      },
      child: BlocBuilder<EditScheduleBloc, EditScheduleState>(
        builder: (context, state) {
          final colorScheme = Theme.of(context).colorScheme;
          final isDark = colorScheme.brightness == Brightness.dark;
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) {
              if (didPop) return;

              context.read<EditScheduleBloc>().add(
                const EditScheduleEvent.exitRequested(),
              );
            },
            child: Scaffold(
              backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
              appBar: CustomButtonAppBar(
                title: '일정 수정',
                leading: Button(
                  icon: const Icon(AppIcon.back),
                  onTap: () {
                    context.read<EditScheduleBloc>().add(
                      const EditScheduleEvent.exitRequested(),
                    );
                  },
                  width: 36,
                  height: 36,
                  backgroundColor: Colors.transparent,
                  contentColor: AppColors.light,
                  borderRadius: 18,
                ),
                actions: [
                  Button(
                    icon: const Icon(AppIcon.search),
                    onTap: () async {
                      final result = await context.push<PlaceCandidate>(
                        '/trip/${state.tripId}/map-search',
                        extra: {
                          'lat': state.lat,
                          'lng': state.lng,
                          'address': state.address,
                        },
                      );

                      if (result != null) {
                        context.read<EditScheduleBloc>().add(
                          EditScheduleEvent.placeSelected(
                            place: result.place,
                            address: result.address,
                            lat: result.lat,
                            lng: result.lng,
                          ),
                        );
                      }
                    },
                    width: 36,
                    height: 36,
                    backgroundColor: Colors.transparent,
                    contentColor: AppColors.light,
                    borderRadius: 18,
                  ),
                  Button(
                    text: '수정',
                    onTap: state.isValid && !state.isSubmitting
                        ? () {
                            context.read<EditScheduleBloc>().add(
                              const EditScheduleEvent.submitPressed(),
                            );
                          }
                        : null,
                    height: 36,
                    backgroundColor: state.isValid
                        ? AppColors.primaryLight
                        : AppColors.dark.withOpacity(0.2),
                    contentColor: AppColors.light,
                    borderRadius: 12,
                    width: 36,
                  ),
                ],
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _sectionTitle('일정 제목'),
                            const SizedBox(height: 8),
                            TextBox(
                              controller: _titleController,
                              hintText: '예: 성산일출봉 방문',
                              maxLength: 20,
                              onChanged: (v) {
                                context.read<EditScheduleBloc>().add(
                                  EditScheduleEvent.titleChanged(v),
                                );
                              },
                            ),

                            const SizedBox(height: 24),

                            _sectionTitle('날짜'),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: _pickerBox(
                                    context,
                                    text: state.date == null
                                        ? '연도. 월. 일.'
                                        : '${state.date!.year}.${state.date!.month}.${state.date!.day}',
                                    icon: AppIcon.calendar,
                                    onTap: () async {
                                      if (state.tripStartDate == null ||
                                          state.tripEndDate == null) {
                                        return;
                                      }

                                      final date = await showDatePicker(
                                        context: context,

                                        initialDate:
                                            state.date ?? state.tripStartDate!,
                                        firstDate: state.tripStartDate!,
                                        lastDate: state.tripEndDate!,
                                      );

                                      if (date != null) {
                                        context.read<EditScheduleBloc>().add(
                                          EditScheduleEvent.dateSelected(date),
                                        );
                                      }
                                    },
                                  ),
                                ),

                                const SizedBox(width: 12),
                                Expanded(
                                  child: _pickerBox(
                                    context,
                                    text: state.time == null
                                        ? '--:--'
                                        : state.time!.format(context),
                                    icon: AppIcon.clock,
                                    onTap: () async {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime:
                                            state.time ?? TimeOfDay.now(),
                                      );
                                      if (time != null) {
                                        context.read<EditScheduleBloc>().add(
                                          EditScheduleEvent.timeSelected(time),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 24),

                            _sectionTitle('장소'),
                            const SizedBox(height: 8),
                            TextBox(
                              controller: _placeController,
                              hintText: '예: 제주 성산읍',
                              prefixIcon: const Icon(AppIcon.mapPin),
                              onChanged: (v) {
                                context.read<EditScheduleBloc>().add(
                                  EditScheduleEvent.placeTextChanged(v),
                                );
                              },
                            ),

                            const SizedBox(height: 24),

                            _sectionTitle('메모 (선택)'),
                            const SizedBox(height: 8),
                            TextBox(
                              controller: _memoController,
                              hintText: '일정에 대한 메모를 작성하세요...',
                              maxLength: 150,
                              maxLines: 4,
                              minLines: 3,
                              onChanged: (v) {
                                context.read<EditScheduleBloc>().add(
                                  EditScheduleEvent.descriptionChanged(v),
                                );
                              },
                            ),

                            const SizedBox(height: 24),

                            _sectionTitle('카테고리'),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _categoryChip(context, '이동', 1, state),
                                _categoryChip(context, '먹거리', 2, state),
                                _categoryChip(context, '관광', 3, state),
                                _categoryChip(context, '휴식', 4, state),
                                _categoryChip(context, '숙박', 5, state),
                                _categoryChip(context, '쇼핑', 6, state),
                                _categoryChip(context, '액티비티', 7, state),
                                _categoryChip(context, '기타', 8, state),
                              ],
                            ),

                            const SizedBox(height: 24),

                            _sectionTitle('함께하는 크루원'),
                            const SizedBox(height: 8),
                            _buildMembersSection(context, state),

                            if (state.selectedScheduleCrew.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              _selectedMembersSummary(state),
                            ],

                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(text, style: AppFont.regular);
  }

  Widget _pickerBox(
    BuildContext context, {
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isDark ? AppColors.navy : AppColors.darkerGray,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 8),
            Text(
              text,
              style: AppFont.regular.copyWith(
                color: isDark ? AppColors.light : AppColors.dark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryChip(
    BuildContext context,
    String label,
    int id,
    EditScheduleState state,
  ) {
    final selected = state.selectedCategoryId == id;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        context.read<EditScheduleBloc>().add(
          EditScheduleEvent.categorySelected(id),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? isDark
                    ? AppColors.primaryDark
                    : AppColors.primaryLight
              : isDark
              ? AppColors.navy.withOpacity(0.4)
              : AppColors.darkerGray,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: AppFont.small.copyWith(
            color: selected
                ? isDark
                      ? AppColors.light
                      : AppColors.light
                : colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

/// ===============================
/// 참여자 UI
/// ===============================

Widget _buildMembersSection(BuildContext context, EditScheduleState state) {
  if (state.tripMembers.isEmpty) {
    return const Text('참여자가 없습니다.', style: TextStyle(color: Colors.grey));
  }

  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: state.tripMembers.map((member) {
      final isSelected = state.selectedScheduleCrew.any(
        (e) => e.id == member.id,
      );

      return GestureDetector(
        onTap: () {
          final bloc = context.read<EditScheduleBloc>();

          if (isSelected) {
            bloc.add(EditScheduleEvent.crewRemoved(member.id!));
          } else {
            bloc.add(EditScheduleEvent.crewAdded(member));
          }
        },
        child: Container(
          width: 96,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryLight.withOpacity(0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? AppColors.primaryLight : AppColors.darkerGray,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: member.profileImg != null
                    ? NetworkImage(member.profileImg!)
                    : null,
                child: member.profileImg == null
                    ? Text(member.nickname!.substring(0, 1))
                    : null,
              ),
              const SizedBox(height: 6),
              Text(
                member.nickname!,
                style: AppFont.small,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
    }).toList(),
  );
}

Widget _selectedMembersSummary(EditScheduleState state) {
  final names = state.selectedScheduleCrew.map((e) => e.nickname).join(', ');

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.primaryLight.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      '선택됨: $names (${state.selectedScheduleCrew.length}명)',
      style: AppFont.small.copyWith(color: AppColors.primaryLight),
    ),
  );
}
