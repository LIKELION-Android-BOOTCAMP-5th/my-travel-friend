import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/widget/bottom_sheat.dart';
import 'package:my_travel_friend/core/widget/floating_button.dart';
import 'package:my_travel_friend/core/widget/pop_up_box.dart';
import 'package:my_travel_friend/core/widget/text_box.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import 'package:my_travel_friend/feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/trip/trip_event.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/trip/trip_state.dart';
import 'package:my_travel_friend/feature/trip/presentation/widgets/empty_travel_card.dart';
import 'package:my_travel_friend/feature/trip/presentation/widgets/trip_card.dart';
import 'package:my_travel_friend/feature/trip/presentation/widgets/trip_screen_app_bar.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../alarm/presentation/viewmodels/alarm_bloc.dart';
import '../../../alarm/presentation/viewmodels/alarm_state.dart';
import '../viewmodels/trip/trip_bloc.dart';

class TripListScreen extends StatefulWidget {
  const TripListScreen({super.key});

  @override
  State<TripListScreen> createState() => _TripListScreenState();
}

class _TripListScreenState extends State<TripListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  late final int userId;

  @override
  void initState() {
    super.initState();

    final authState = context.read<AuthProfileBloc>().state;
    // 초기 userId 설정 (인증 상태를 확인하여)
    if (authState is AuthProfileAuthenticated) {
      userId = authState.userInfo.id!;
    } else {
      userId = 0; // 안전한 기본값 설정 (실제 앱에서는 이전에 로딩 오버레이로 막혔을 것)
    }

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final tripState = context.read<TripBloc>().state;

    if (tripState.search && tripState.searchTrips == null) {
      return;
    }

    if (tripState.isLoadingMore) {
      return;
    }
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<TripBloc>().add(TripEvent.loadMoreTrips(userId: userId));
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  //여행 매뉴 보여주기
  void _showMenu(dynamic trip) {
    final authState = context.read<AuthProfileBloc>().state;
    if (authState is! AuthProfileAuthenticated) return;
    final currentUserId = authState.userInfo.id!;

    CommonBottomSheet.show(
      context,
      sheetTitle: "여행 관리",
      actions: [
        BottomSheetAction(
          icon: Icon(AppIcon.edit),
          iconBgColor: AppColors.primaryLight,
          title: "여행계획 수정하기",
          onTap: () {
            // navigateToEdit 상태를 true로 설정하는 이벤트
            context.read<TripBloc>().add(TripEvent.updateTrip(trip: trip));
          },
        ),
        BottomSheetAction(
          icon: Icon(AppIcon.delete),
          iconBgColor: AppColors.secondary,
          title: "여행 포기하기",
          onTap: () {
            _showLeavePopUp(trip, currentUserId);
          },
        ),
      ],
    );
  }

  //여행포기
  void _showLeavePopUp(dynamic trip, int userId) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopUpBox(
        title: "여행을 포기하시겠어요?",
        message: "참여 중인 여행에서 제외됩니다.",
        rightText: "포기하기",
        onRight: () {
          Navigator.of(context).pop();
          context.read<TripBloc>().add(
            TripEvent.leaveTrip(tripId: trip.id!, userId: userId),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;
    final TripBloc tripBloc = context.read<TripBloc>();

    //네비게이션 처리를 위한 MultiBlocListener
    return MultiBlocListener(
      listeners: [
        // 여행 생성 네비게이션 리스너
        BlocListener<TripBloc, TripState>(
          listenWhen: (prev, curr) =>
              prev.navigateToCreate != curr.navigateToCreate,
          listener: (context, state) async {
            if (state.navigateToCreate) {
              tripBloc.add(const TripEvent.navigationHandled());
              // GoRouter 푸시 및 결과값 대기
              final result = await context.push(
                '/trip/create',
                extra: {"userId": userId},
              );
              if (result == true && context.mounted) {
                // 생성 성공 시 목록 새로고침
                tripBloc.add(TripEvent.refreshTrips(userId: userId));
              }
            }
          },
        ),
        // 여행 수정 네비게이션 리스너
        BlocListener<TripBloc, TripState>(
          listenWhen: (prev, curr) =>
              prev.navigateToEdit != curr.navigateToEdit,
          listener: (context, state) async {
            if (state.navigateToEdit && state.selectedTrip != null) {
              tripBloc.add(const TripEvent.navigationHandled());
              // GoRouter 푸시 및 결과값 대기
              final result = await context.push(
                '/trip/edit',
                extra: {"trip": state.selectedTrip},
              );
              if (result == true && context.mounted) {
                // 수정 성공 시 목록 새로고침
                tripBloc.add(TripEvent.refreshTrips(userId: userId));
              }
            }
          },
        ),
      ],

      child: Scaffold(
        backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,

        // AppBar: AlarmBloc 상태 변화에만 반응하도록 BlocSelector 사용 (리빌드 범위 최소화)
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: BlocSelector<AlarmBloc, AlarmState, bool>(
            selector: (state) => state.hasUnread,
            builder: (context, hasUnreadAlarm) {
              final isSearching = context.watch<TripBloc>().state.search;
              final TripBloc tripBloc = context.read<TripBloc>();

              return HomeAppBar(
                hasUnreadAlarm: hasUnreadAlarm,
                onLogoTap: () {
                  debugPrint('홈 로고 클릭');
                },
                onSearchTap: () {
                  tripBloc.add(TripEvent.toggleSearch());
                },
                searchIcon: isSearching ? AppIcon.close : AppIcon.search,
                onAlarmTap: () {
                  context.push('/alarm');
                },
                onSettingTap: () {
                  context.push('/setting');
                },
              );
            },
          ),
        ),

        body: SafeArea(
          //Body: TripBloc의 목록 데이터와 검색 상태에만 반응하는 BlocBuilder (핵심)
          child: BlocBuilder<TripBloc, TripState>(
            buildWhen: (prev, curr) =>
                prev.trips != curr.trips ||
                prev.searchTrips != curr.searchTrips ||
                prev.search != curr.search,
            builder: (context, tripState) {
              final isSearching = tripState.search;
              final hasSearched = tripState.searchTrips != null;

              final trips = !isSearching
                  ? tripState.trips ?? []
                  : hasSearched
                  ? tripState.searchTrips!
                  : tripState.trips ?? [];

              return Column(
                children: [
                  // 검색창 위젯 (isSearching 상태에 따라 표시/숨김)
                  _buildSearchBar(isSearching, colorScheme, tripBloc),

                  // 여행 목록 또는 Empty UI
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        tripBloc.add(TripEvent.refreshTrips(userId: userId));
                      },
                      child: trips.isEmpty && (!isSearching || hasSearched)
                          ? _buildEmptyUI(isSearching, context)
                          : _buildTripListView(trips),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        floatingActionButton: FloatingButton(
          icon: const Icon(Icons.add, size: 34, color: AppColors.light),
          onPressed: () {
            tripBloc.add(TripEvent.createNewTrip());
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  // 검색창 위젯
  Widget _buildSearchBar(
    bool isSearching,
    ColorScheme colorScheme,
    TripBloc bloc,
  ) {
    if (!isSearching) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextBox(
        unfocusedBorderColor: colorScheme.primary,
        controller: _searchController,
        hintText: "여행 검색...",
        prefixIcon: Icon(AppIcon.search),
        onChanged: (value) {
          bloc.add(TripEvent.searchKeywordChanged(keyword: value));
        },
        onSubmitted: (value) {
          if (value.trim().isEmpty) return;

          bloc.add(
            TripEvent.searchTrips(userId: userId, keyword: value.trim()),
          );
        },

        textInputAction: TextInputAction.search,
      ),
    );
  }

  // 여행 목록 ListView 위젯
  Widget _buildTripListView(List<dynamic> trips) {
    return ListView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: trips.length,
      itemBuilder: (context, index) {
        final trip = trips[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: TripCard(
            title: trip.title,
            startDate: formatDate(trip.startAt),
            endDate: formatDate(trip.endAt),
            peopleCount: trip.crewCount,
            backgroundColor: trip.coverType == "IMAGE"
                ? null
                : getCoverColor(trip.coverType),
            backgroundImageUrl: trip.coverType == "IMAGE"
                ? trip.coverImg
                : null,
            onTap: () {
              context.go('/trip/${trip.id}/trip_home');
            },
            onMenu: () => _showMenu(trip),
          ),
        );
      },
    );
  }

  /// empty UI
  Widget _buildEmptyUI(bool isSearching, BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6, // 중앙 배치용
          child: Center(
            child: EmptyTravelCard(
              title: isSearching ? "검색 결과가 없어요" : "아직 여행이 없어요!",
              description: isSearching
                  ? "다른 검색어로 다시 시도해보세요!"
                  : "새로운 여행을 계획해보세요!",
            ),
          ),
        ),
      ],
    );
  }

  Color getCoverColor(String coverType) {
    switch (coverType) {
      case "Pink":
        return AppColors.lightPink;
      case "YELLOW":
        return AppColors.tertiary;
      case "BLUE":
        return AppColors.primaryLight;
      case "VIOLET":
        return AppColors.lightPurple;
      case "GREEN":
        return AppColors.lightGreen;
      case "RED":
        return AppColors.secondary;
      default:
        return AppColors.primaryLight;
    }
  }

  String formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      // yyyy/mm/dd 형식으로 포맷
      return "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
    } catch (e) {
      return dateStr;
    }
  }
}
