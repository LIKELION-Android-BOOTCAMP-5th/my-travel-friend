import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/trip_entity.dart';

part 'trip_detail_state.freezed.dart';

// [이재은] 라우팅을 위한 상세 상태
enum TripDetailPageState { initial, loading, loaded, error }

@freezed
abstract class TripDetailState with _$TripDetailState {
  const TripDetailState._();

  const factory TripDetailState({
    @Default(TripDetailPageState.initial) TripDetailPageState pageState,
    TripEntity? trip,
    String? errorMessage,
  }) = _TripDetailState;
}
