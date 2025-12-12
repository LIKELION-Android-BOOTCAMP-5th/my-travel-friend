import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/trip_entity.dart';

part 'trip_detail_event.freezed.dart';

// [이재은] 라우팅을 위한 이벤트
@freezed
abstract class TripDetailEvent with _$TripDetailEvent {
  // 여행 상세 정보 로드
  const factory TripDetailEvent.loadTripDetail({required int tripId}) =
      LoadTripDetail;

  // 여행 정보 업데이트 (수정 후)
  const factory TripDetailEvent.updateTripDetail({required TripEntity trip}) =
      UpdateTripDetail;

  // 여행 새로고침
  const factory TripDetailEvent.refreshTripDetail() = RefreshTripDetail;

  // 여행 포기
  const factory TripDetailEvent.leaveTrip({
    required int tripId,
    required int userId,
  }) = LeaveTrip;
}
