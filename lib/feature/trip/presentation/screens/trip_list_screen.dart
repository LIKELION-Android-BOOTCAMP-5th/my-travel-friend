import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:my_travel_friend/theme/app_colors.dart';
import 'package:my_travel_friend/theme/app_icon.dart';

import '../viewmodels/trip/trip_bloc.dart';

class TripListScreen extends StatefulWidget {
  const TripListScreen({super.key});

  @override
  State<TripListScreen> createState() => _TripListScreenState();
}

class _TripListScreenState extends State<TripListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// 무한 스크롤 처리
    _scrollController.addListener(() {
      final bloc = context.read<TripBloc>();
      final authState = context.read<AuthProfileBloc>().state;

      if (authState is! AuthProfileAuthenticated) return;

      final userId = authState.userInfo.id!;

      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        bloc.add(TripEvent.loadMoreTrips(userId: userId));
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  /// TripCard 메뉴 BottomSheet
  void _showMenu(trip) {
    final authState = context.read<AuthProfileBloc>().state;

    if (authState is! AuthProfileAuthenticated) return;

    final userId = authState.userInfo.id!;

    CommonBottomSheet.show(
      context,
      sheetTitle: "여행 관리",
      actions: [
        BottomSheetAction(
          icon: Icon(AppIcon.edit),
          iconBgColor: AppColors.primaryLight,
          title: "여행계획 수정하기",
          onTap: () {
            context.read<TripBloc>().add(TripEvent.updateTrip(trip: trip));
          },
        ),
        BottomSheetAction(
          icon: Icon(AppIcon.delete),
          iconBgColor: Colors.redAccent,
          title: "여행 포기하기",
          onTap: () {
            _showLeavePopUp(trip, userId);
          },
        ),
      ],
    );
  }

  /// 여행 포기 PopUp
  void _showLeavePopUp(trip, int userId) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopUpBox(
        title: "여행을 포기하시겠어요?",
        message: "참여 중인 여행에서 제외됩니다.",
        rightText: "포기하기",
        onRight: () {
          context.read<TripBloc>().add(
            TripEvent.leaveTrip(tripId: trip.id!, userId: userId),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthProfileBloc>().state;

    if (authState is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    final userId = authState.userInfo.id!;
    return BlocBuilder<TripBloc, TripState>(
      builder: (context, state) {
        final bloc = context.read<TripBloc>();
        final isSearching = state.search;

        final trips = state.search
            ? state.searchTrips ?? []
            : state.trips ?? [];

        return Scaffold(
          backgroundColor: AppColors.lightGray,

          /// 상단 앱바 추가
          appBar: HomeAppBar(
            onLogoTap: () {
              debugPrint("홈 로고 클릭");
            },

            /// 검색 버튼 토글 처리
            onSearchTap: () {
              bloc.add(TripEvent.toggleSearch());
            },

            /// 검색 상태면 close 아이콘 / 아니면 search 아이콘
            searchIcon: isSearching ? AppIcon.close : AppIcon.search,

            onAlarmTap: () {
              debugPrint("알림 클릭");
            },
            onSettingTap: () {
              debugPrint("설정 클릭");
            },
          ),

          body: SafeArea(
            child: Column(
              children: [
                /// 검색 On일 때만 TextBox 노출
                if (isSearching)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: TextBox(
                      controller: _searchController,
                      hintText: "여행 검색...",
                      prefixIcon: Icon(AppIcon.search),
                      onChanged: (value) {
                        bloc.add(
                          TripEvent.searchKeywordChanged(keyword: value),
                        );
                      },
                      textInputAction: TextInputAction.search,
                    ),
                  ),

                /// 리스트 영역
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      bloc.add(TripEvent.refreshTrips(userId: userId));
                    },
                    child: trips.isEmpty
                        ? _buildEmptyUI(isSearching)
                        : ListView.builder(
                            controller: _scrollController,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            itemCount: trips.length,
                            itemBuilder: (context, index) {
                              final trip = trips[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 14),
                                child: TripCard(
                                  title: trip.title,
                                  startDate: trip.startAt,
                                  endDate: trip.endAt,
                                  peopleCount: trip.crewCount,
                                  backgroundColor: getCoverColor(
                                    trip.coverType,
                                  ),
                                  onTap: () {
                                    bloc.add(TripEvent.selectTrip(trip: trip));
                                  },
                                  onMenu: () => _showMenu(trip),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),

          /// 새 여행 만들기 버튼
          floatingActionButton: FloatingButton(
            icon: const Icon(Icons.add, size: 34, color: AppColors.light),
            onPressed: () {
              bloc.add(TripEvent.createNewTrip());
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }

  /// empty UI
  Widget _buildEmptyUI(bool isSearching) {
    if (isSearching) {
      return const Center(
        child: EmptyTravelCard(
          title: "검색 결과가 없어요",
          description: "다른 검색어로 다시 시도해보세요!",
        ),
      );
    }
    return const Center(
      child: EmptyTravelCard(
        title: "아직 여행이 없어요!",
        description: "새로운 여행을 계획해보세요!",
      ),
    );
  }

  Color getCoverColor(String coverType) {
    switch (coverType) {
      case "pink":
        return AppColors.lightPink;
      case "yellow":
        return AppColors.tertiary;
      case "blue":
        return AppColors.primaryLight;
      default:
        return AppColors.primaryLight;
    }
  }
}
