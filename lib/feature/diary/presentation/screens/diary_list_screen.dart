import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/public_tab.dart';
import 'package:my_travel_friend/theme/app_colors.dart';

import '../../../../core/widget/floating_button.dart';
import '../../../../theme/app_font.dart';
import '../../../../theme/app_icon.dart';
import '../viewmodels/diary_bloc.dart';
import '../viewmodels/diary_event.dart';
import '../viewmodels/diary_page_state.dart';
import '../viewmodels/diary_state.dart';
import '../widgets/diary_box.dart';
import '../widgets/diary_filter_chip.dart';

// [이재은] 다이어리 탭 화면
// - 다이어리 리스트 확인 가능 (공유 / 개인, 혹은 타입별 - 메모 / 리뷰 / 사진 / 소비)
// - 리스트 내 박스 클릭 시 다이어리 상세보기 팝업 오픈
// - 우측 하단 플로팅 버튼 클릭을 통해 작성 화면 오픈

class DiaryListScreen extends StatefulWidget {
  final int tripId;
  final int userId; // 로그인한 사용자 ID

  const DiaryListScreen({
    super.key,
    required this.tripId,
    required this.userId,
  });

  @override
  State<DiaryListScreen> createState() => _DiaryListScreenState();
}

class _DiaryListScreenState extends State<DiaryListScreen> {
  late ScrollController _scrollController;

  static const List<String?> _filterTypes = [
    null,
    'MEMO',
    'REVIEW',
    'PHOTO',
    'MONEY',
  ];
  static const List<String> _filterLabels = ['전체', '메모', '리뷰', '사진', '소비'];

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

  @override
  void _onScroll() {
    if (_isBottom) {
      context.read<DiaryBloc>().add(const DiaryEvent.loadMore());
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
    final diaryBloc = BlocProvider.of<DiaryBloc>(context);
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        // 모드(라이트/다크)에 따른 배경 색 변경
        backgroundColor: isDark ? AppColors.navy : AppColors.lessLight,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 공유/개인 다이어리 탭
              _buildPublicTabs(context, diaryBloc),
              const SizedBox(height: 16),
              // 타입별 필터
              _buildFilterChips(context, diaryBloc),
              const SizedBox(height: 16),
              // 다이어리 리스트 출력
              Expanded(child: _buildDiaryList(context, diaryBloc)),
            ],
          ),
        ),

        // 플로팅 버튼 -> 다이어리 작성
        floatingActionButton: FloatingButton(
          icon: Icon(AppIcon.plus, color: AppColors.light),
          backgroundColor: AppColors.secondary,
          onPressed: () => _onAddDiary(context),
        ),
      ),
    );
  }

  // 공유<->개인 다이어리 탭 빌드
  Widget _buildPublicTabs(BuildContext context, DiaryBloc diaryBloc) {
    return BlocBuilder<DiaryBloc, DiaryState>(
      // 리빌드 조건 - 이전(prev)과 현재(curr)가 다를때
      buildWhen: (prev, curr) => prev.isMyDiaries != curr.isMyDiaries,
      builder: (context, state) {
        return Container(
          child: Row(
            children: [
              // 공유 다이어리 탭
              Expanded(
                child: PublicTab(
                  label: '공유 다이어리',
                  isSelected: !state.isMyDiaries,
                  onTap: () {
                    diaryBloc.add(
                      DiaryEvent.getOurDiaries(tripId: widget.tripId),
                    );
                  },
                ),
              ),
              SizedBox(width: 8.0),
              // 내 다이어리 탭
              Expanded(
                child: PublicTab(
                  label: '내 다이어리',
                  isSelected: state.isMyDiaries,
                  onTap: () {
                    diaryBloc.add(
                      DiaryEvent.getMyDiaries(
                        tripId: widget.tripId,
                        userId: widget.userId,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 타입별 필터
  Widget _buildFilterChips(BuildContext context, DiaryBloc diaryBloc) {
    return BlocBuilder<DiaryBloc, DiaryState>(
      buildWhen: (prev, curr) => prev.currentFilter != curr.currentFilter,
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(_filterTypes.length, (index) {
              final type = _filterTypes[index];
              final label = _filterLabels[index];
              final isSelected = state.currentFilter == type;

              return Padding(
                padding: EdgeInsets.only(
                  right: index < _filterTypes.length - 1 ? 6 : 0,
                ),
                child: DiaryFilterChip(
                  label: label,
                  isSelected: isSelected,
                  onTap: () {
                    diaryBloc.add(DiaryEvent.filterByType(type: type));
                  },
                ),
              );
            }),
          ),
        );
      },
    );
  }

  // 다이어리 리스트
  Widget _buildDiaryList(BuildContext context, DiaryBloc diaryBloc) {
    return BlocBuilder<DiaryBloc, DiaryState>(
      buildWhen: (prev, curr) =>
          prev.diaries != curr.diaries ||
          prev.hasMore != curr.hasMore ||
          prev.isLoadingMore != curr.isLoadingMore,
      builder: (context, state) {
        final diaries = state.diaries;

        if (state.pageState == DiaryPageState.init) {
          return const SizedBox.shrink();
        }

        if (diaries.isEmpty) {
          return _buildEmptyView(context);
        }

        return RefreshIndicator(
          onRefresh: () async {
            diaryBloc.add(const DiaryEvent.refresh());
          },
          child: ListView.separated(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: diaries.length + (state.hasMore ? 1 : 0),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final diary = diaries[index];

              return GestureDetector(
                onTap: () {
                  if (diary.id != null) {
                    diaryBloc.add(DiaryEvent.getDiaryById(diaryId: diary.id!));
                  }
                },
                child: DiaryBox(diary: diary),
              );
            },
          ),
        );
      },
    );
  }

  // 다이어리 빈 화면일 때 (목록에 들어있는 다이어리가 없을 때)
  Widget _buildEmptyView(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AppIcon.diary,
            size: 64,
            color: colorScheme.onSurfaceVariant.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            '작성된 다이어리가 없습니다\n당신의 여행 기록을 남겨보세요',
            style: AppFont.regular.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // 다이어리 작성 화면으로 이동
  void _onAddDiary(BuildContext context) {}
}
