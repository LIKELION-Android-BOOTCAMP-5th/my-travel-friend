import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../trip/domain/entities/trip_entity.dart';
import '../../../trip/presentation/viewmodels/trip/trip_bloc.dart';
import '../../../trip/presentation/viewmodels/trip_request/trip_request_bloc.dart';
import '../../../trip/presentation/viewmodels/trip_request/trip_request_event.dart';
import '../../../trip/presentation/viewmodels/trip_request/trip_request_state.dart';

class TripInvitePopUp extends StatelessWidget {
  final int myUserId;
  final int targetUserId;
  final String? targetNickname;

  TripInvitePopUp({
    super.key,
    required this.myUserId,
    required this.targetUserId,
    this.targetNickname,
  });

  final ValueNotifier<int?> _selectedTripId = ValueNotifier<int?>(null);

  String _formatDate(String iso) {
    if (iso.isEmpty) return '';
    return iso.split('T').first.replaceAll('-', '.');
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tripState = context.watch<TripBloc>().state;
    final trState = context.watch<TripRequestBloc>().state;

    final trips = (tripState.trips ?? <TripEntity>[]);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 타이틀
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '여행 선택하기',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${targetNickname ?? "상대"}님을 초대한 여행을 선택하세요',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
            ),
            const SizedBox(height: 16),

            // 리스트
            Flexible(
              child: trips.isEmpty
                  ? Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: cs.surfaceVariant,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text('초대할 여행이 없어요'),
                    )
                  : ValueListenableBuilder<int?>(
                      valueListenable: _selectedTripId,
                      builder: (context, selectedId, _) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: trips.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final trip = trips[index];
                            final isSelected = (trip.id == selectedId);

                            return GestureDetector(
                              onTap: () {
                                final id = trip.id;
                                if (id == null) return;

                                _selectedTripId.value = id;

                                context.read<TripRequestBloc>().add(
                                  TripRequestEvent.getInviteExcludes(
                                    tripId: id,
                                  ),
                                );
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 120),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),

                                  image:
                                      trip.coverType == "IMAGE" &&
                                          trip.coverImg != null
                                      ? DecorationImage(
                                          image: NetworkImage(trip.coverImg!),
                                          fit: BoxFit.cover,
                                        )
                                      : null,

                                  color: trip.coverType == "IMAGE"
                                      ? null
                                      : _colorByCoverType(trip.coverType, cs),

                                  border: Border.all(
                                    width: isSelected ? 2 : 0,
                                    color: isSelected
                                        ? cs.primary
                                        : Colors.transparent,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    if (trip.coverType == "IMAGE")
                                      Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              18,
                                            ),
                                            color: Colors.black.withOpacity(
                                              0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                trip.title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: cs.onPrimary,
                                                    ),
                                              ),
                                            ),
                                            if (isSelected)
                                              Icon(
                                                AppIcon.checkCircle,
                                                color: cs.onPrimary,
                                              ),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          '${trip.place} · ${_formatDate(trip.startAt)} - ${_formatDate(trip.endAt)}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: cs.onPrimary.withOpacity(
                                                  0.9,
                                                ),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),

            const SizedBox(height: 12),

            // 선택된 trip 기준으로 "이미 초대/이미 크루" 안내 문구
            ValueListenableBuilder<int?>(
              valueListenable: _selectedTripId,
              builder: (context, selectedId, _) {
                if (selectedId == null) return const SizedBox.shrink();

                final isPending = trState.pendingTargetIds.contains(
                  targetUserId,
                );
                final isCrew = trState.crewUserIds.contains(targetUserId);

                // excludes가 아직 로딩 중이면 안내 안 띄움(헷갈리니까)
                if (trState.pageState == TripRequestPageState.loading &&
                    trState.actionType == 'get_invite_excludes') {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: cs.primary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '초대 가능 여부 확인 중...',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: cs.onSurfaceVariant),
                        ),
                      ],
                    ),
                  );
                }

                if (!isPending && !isCrew) return const SizedBox.shrink();

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Icon(AppIcon.alert, size: 16, color: cs.error),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          isCrew ? '이미 이 여행의 크루원이에요' : '이미 초대가 진행 중이에요',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(color: cs.error),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            // 하단 버튼
            ValueListenableBuilder<int?>(
              valueListenable: _selectedTripId,
              builder: (context, selectedId, _) {
                final hasTripSelected = selectedId != null;

                final isPending = trState.pendingTargetIds.contains(
                  targetUserId,
                );
                final isCrew = trState.crewUserIds.contains(targetUserId);
                final blocked = hasTripSelected && (isPending || isCrew);

                final checking =
                    hasTripSelected &&
                    trState.pageState == TripRequestPageState.loading &&
                    trState.actionType == 'get_invite_excludes';

                final enabled = hasTripSelected && !blocked && !checking;

                return Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 46,
                        child: TextButton(
                          onPressed: () => context.pop(),
                          style: TextButton.styleFrom(
                            backgroundColor: cs.outlineVariant,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            '취소',
                            style: TextStyle(color: cs.onSurface),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 46,
                        child: TextButton(
                          onPressed: enabled
                              ? () {
                                  context.read<TripRequestBloc>().add(
                                    TripRequestEvent.createTripRequest(
                                      requestId: myUserId,
                                      targetId: targetUserId,
                                      tripId: selectedId,
                                    ),
                                  );
                                  Navigator.pop(context);
                                }
                              : null,
                          style: TextButton.styleFrom(
                            backgroundColor: enabled
                                ? cs.primary
                                : cs.outlineVariant,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            checking
                                ? '확인중...'
                                : blocked
                                ? (isCrew ? '이미 크루' : '초대 진행중')
                                : '초대하기',
                            style: TextStyle(
                              color: enabled ? AppColors.lessLight : cs.outline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _colorByCoverType(String coverType, ColorScheme cs) {
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
        return cs.primaryContainer;
    }
  }
}
