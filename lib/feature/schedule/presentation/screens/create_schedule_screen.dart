import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/theme/app_icon.dart';

import '../../../../../core/widget/button.dart';
import '../../../../../core/widget/text_box.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/pop_up_box.dart';
import '../viewmodels/create_schedule/create_schedule_blco.dart';
import '../viewmodels/create_schedule/create_schedule_event.dart';
import '../viewmodels/create_schedule/create_schedule_state.dart';
import '../viewmodels/map_search/map_search_state.dart';

class CreateScheduleScreen extends StatefulWidget {
  final int tripId;
  final int userId;

  const CreateScheduleScreen({
    super.key,
    required this.tripId,
    required this.userId,
  });

  @override
  State<CreateScheduleScreen> createState() => _CreateScheduleScreenState();
}

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  final _titleController = TextEditingController();
  final _memoController = TextEditingController();
  final _placeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // ✅ Bloc 초기 상태를 기반으로 controller 초기값 세팅
    final state = context.read<CreateScheduleBloc>().state;

    _titleController.text = state.title ?? '';
    _memoController.text = state.description ?? '';
    _placeController.text = state.place ?? '';
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
    return BlocListener<CreateScheduleBloc, CreateScheduleState>(
      listenWhen: (prev, curr) =>
          prev.actionType != curr.actionType || prev.message != curr.message,
      listener: (context, state) async {
        if (state.actionType == 'pop') {
          Navigator.of(context).pop(false);
        }

        if (state.actionType == 'exit_confirm') {
          final result = await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (_) => PopUpBox(
              title: '일정 생성을 취소할까요?',
              message: '지금 나가면 작성 중인 내용이 저장되지 않아요.',
              leftText: '취소',
              rightText: '확인',
              onRight: () {
                Navigator.of(context).pop(true);
              },
            ),
          );

          if (result == true && context.mounted) {
            context.read<CreateScheduleBloc>().add(
              const CreateScheduleEvent.exitConfirmed(),
            );
          }

          context.read<CreateScheduleBloc>().add(
            const CreateScheduleEvent.clearMessage(),
          );
        }

        if (state.pageState == CreateSchedulepageState.success) {
          Navigator.of(context).pop(true);
        }
      },
      child: BlocBuilder<CreateScheduleBloc, CreateScheduleState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              context.read<CreateScheduleBloc>().add(
                const CreateScheduleEvent.exitRequested(),
              );
              return false;
            },
            child: Scaffold(
              appBar: CustomButtonAppBar(
                title: '일정 추가',
                leading: Button(
                  icon: const Icon(AppIcon.back),
                  onTap: () {
                    context.read<CreateScheduleBloc>().add(
                      const CreateScheduleEvent.exitRequested(),
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
                        '/trip/${widget.tripId}/map-search',
                        extra: {
                          'lat': state.lat,
                          'lng': state.lng,
                          'address': state.address,
                        },
                      );

                      if (result != null) {
                        context.read<CreateScheduleBloc>().add(
                          CreateScheduleEvent.placeSelected(
                            place: result.place,
                            address: result.address,
                            lat: result.lat,
                            lng: result.lng,
                          ),
                        );

                        _placeController.text = result.place;
                      }
                    },
                    width: 36,
                    height: 36,
                    backgroundColor: Colors.transparent,
                    contentColor: AppColors.light,
                    borderRadius: 18,
                  ),
                ],
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle('일정 제목'),
                      const SizedBox(height: 8),
                      TextBox(
                        controller: _titleController,
                        hintText: '예: 성산일출봉 방문',
                        onChanged: (v) {
                          context.read<CreateScheduleBloc>().add(
                            CreateScheduleEvent.titleChanged(v),
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
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: state.date ?? DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (date != null) {
                                  context.read<CreateScheduleBloc>().add(
                                    CreateScheduleEvent.dateSelected(date),
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
                                  initialTime: state.time ?? TimeOfDay.now(),
                                );
                                if (time != null) {
                                  context.read<CreateScheduleBloc>().add(
                                    CreateScheduleEvent.timeSelected(time),
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
                          context.read<CreateScheduleBloc>().add(
                            CreateScheduleEvent.placeTextChanged(v),
                          );
                        },
                      ),

                      const SizedBox(height: 24),

                      _sectionTitle('메모 (선택)'),
                      const SizedBox(height: 8),
                      TextBox(
                        controller: _memoController,
                        hintText: '일정에 대한 메모를 작성하세요...',
                        maxLines: 4,
                        minLines: 3,
                        onChanged: (v) {
                          context.read<CreateScheduleBloc>().add(
                            CreateScheduleEvent.descriptionChanged(v),
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
                      _buildMembersSection(state),

                      if (state.selectedScheduleCrew.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        _selectedMembersSummary(state),
                      ],

                      const SizedBox(height: 32),

                      Row(
                        children: [
                          Expanded(
                            child: Button(
                              text: '취소',
                              onTap: () {
                                context.read<CreateScheduleBloc>().add(
                                  const CreateScheduleEvent.exitRequested(),
                                );
                              },
                              width: double.infinity,
                              height: 48,
                              backgroundColor: AppColors.lightGray,
                              contentColor: Colors.black,
                              borderRadius: 12,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Button(
                              text: '저장',
                              onTap: state.isValid
                                  ? () {
                                      context.read<CreateScheduleBloc>().add(
                                        const CreateScheduleEvent.submitPressed(),
                                      );
                                    }
                                  : null,
                              width: double.infinity,
                              height: 48,
                              backgroundColor: state.isValid
                                  ? AppColors.primaryLight
                                  : AppColors.lightGray,
                              contentColor: Colors.white,
                              borderRadius: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.darkerGray,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 8),
            Text(text, style: AppFont.regular),
          ],
        ),
      ),
    );
  }

  Widget _categoryChip(
    BuildContext context,
    String label,
    int id,
    CreateScheduleState state,
  ) {
    final selected = state.selectedCategoryId == id;

    return GestureDetector(
      onTap: () {
        context.read<CreateScheduleBloc>().add(
          CreateScheduleEvent.categorySelected(id),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryLight : AppColors.darkerGray,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: AppFont.small.copyWith(
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

Widget _buildMembersSection(CreateScheduleState state) {
  // 로딩 중
  if (state.pageState == CreateSchedulepageState.loading &&
      state.tripMembers.isEmpty) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: CircularProgressIndicator(),
      ),
    );
  }

  // 참여자 없음
  if (state.tripMembers.isEmpty) {
    return const Text('참여자가 없습니다.', style: TextStyle(color: Colors.grey));
  }

  return Builder(
    builder: (context) {
      return Wrap(
        spacing: 12,
        runSpacing: 12,
        children: state.tripMembers.map((member) {
          final isSelected = state.selectedScheduleCrew.any(
            (e) => e.id == member.id,
          );

          return GestureDetector(
            onTap: () {
              if (isSelected) {
                context.read<CreateScheduleBloc>().add(
                  CreateScheduleEvent.crewRemoved(member.id!),
                );
              } else {
                context.read<CreateScheduleBloc>().add(
                  CreateScheduleEvent.crewAdded(member),
                );
              }
            },
            child: Container(
              width: 96,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryLight.withOpacity(0.15)
                    : AppColors.darkerGray,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryLight
                      : Colors.transparent,
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
                        ? Text(
                            member.nickname!.substring(0, 1),
                            style: AppFont.regular,
                          )
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
    },
  );
}

Widget _selectedMembersSummary(CreateScheduleState state) {
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
