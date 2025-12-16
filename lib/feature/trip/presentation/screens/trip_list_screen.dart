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

    final bloc = context.read<TripBloc>();
    final authState = context.read<AuthProfileBloc>().state;

    if (authState is AuthProfileAuthenticated) {
      final userId = authState.userInfo.id!;

      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
          bloc.add(TripEvent.loadMoreTrips(userId: userId));
        }
      });
    }
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
          iconBgColor: AppColors.secondary,
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
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    final authState = context.watch<AuthProfileBloc>().state;

    if (authState is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    final userId = authState.userInfo.id!;

    return MultiBlocListener(
      listeners: [
        BlocListener<TripBloc, TripState>(
          listenWhen: (prev, curr) =>
              prev.navigateToCreate != curr.navigateToCreate,
          listener: (context, state) async {
            if (state.navigateToCreate) {
              context.read<TripBloc>().add(const TripEvent.navigationHandled());

              final result = await context.push(
                '/trip/create',
                extra: {"userId": userId},
              );

              if (result == true) {
                context.read<TripBloc>().add(
                  TripEvent.refreshTrips(userId: userId),
                );
              }
            }
          },
        ),

        BlocListener<TripBloc, TripState>(
          listenWhen: (prev, curr) =>
              prev.navigateToEdit != curr.navigateToEdit,
          listener: (context, state) async {
            if (state.navigateToEdit && state.selectedTrip != null) {
              context.read<TripBloc>().add(const TripEvent.navigationHandled());

              final result = await context.push(
                '/trip/edit',
                extra: {"trip": state.selectedTrip},
              );

              if (result == true) {
                context.read<TripBloc>().add(
                  TripEvent.refreshTrips(userId: userId),
                );
              }
            }
          },
        ),
      ],
      child: BlocBuilder<TripBloc, TripState>(
        builder: (context, state) {
          final bloc = context.read<TripBloc>();
          final isSearching = state.search;

          final trips = state.search
              ? state.searchTrips ?? []
              : state.trips ?? [];

          return Scaffold(
            backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,

            /// 상단 앱바 추가
            appBar: HomeAppBar(
              onLogoTap: () {
                debugPrint("홈 로고 클릭");
              },

              onSearchTap: () {
                bloc.add(TripEvent.toggleSearch());
              },

              searchIcon: isSearching ? AppIcon.close : AppIcon.search,

              onAlarmTap: () {
                context.push('/alarm');
              },
              onSettingTap: () {
                context.push('/setting');
              },
            ),

            body: SafeArea(
              child: Column(
                children: [
                  if (isSearching)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: TextBox(
                        unfocusedBorderColor: colorScheme.primary,
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

                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        bloc.add(TripEvent.refreshTrips(userId: userId));
                      },
                      child: trips.isEmpty
                          ? _buildEmptyUI(isSearching)
                          : ListView.builder(
                              controller: _scrollController,
                              physics: const AlwaysScrollableScrollPhysics(),
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
                                    startDate: formatDate(trip.startAt),
                                    endDate: formatDate(trip.endAt),
                                    peopleCount: trip.crewCount,
                                    backgroundColor: trip.coverType == "IMAGE"
                                        ? null
                                        : getCoverColor(trip.coverType),
                                    backgroundImageUrl:
                                        trip.coverType == "IMAGE"
                                        ? trip.coverImg
                                        : null,
                                    onTap: () {
                                      context.go('/trip/${trip.id}/diary');
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

            floatingActionButton: FloatingButton(
              icon: const Icon(Icons.add, size: 34, color: AppColors.light),
              onPressed: () {
                /// 🔥 여기서 이벤트만 보내면 자동 이동됨!
                bloc.add(TripEvent.createNewTrip());
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
        },
      ),
    );
  }

  /// empty UI
  Widget _buildEmptyUI(bool isSearching) {
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
}

String formatDate(String dateStr) {
  try {
    final date = DateTime.parse(dateStr);
    return "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
  } catch (e) {
    return dateStr;
  }
}
