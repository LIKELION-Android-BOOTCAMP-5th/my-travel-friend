import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/trip_entity.dart';
import '../../../domain/entities/trip_request_entity.dart';

part 'trip_request_state.freezed.dart';

enum TripRequestPageState { init, loading, loaded, success, error }

@freezed
abstract class TripRequestState with _$TripRequestState {
  const factory TripRequestState({
    @Default([]) List<TripRequestEntity> tripRequests, // 받은 초대 목록

    @Default([]) List<TripEntity> invitedTrips, //id로 조회한 여행들

    String? message,
    String? errorType,
    String? actionType,
    @Default(TripRequestPageState.init) TripRequestPageState pageState,
  }) = _TripRequestState;
}
