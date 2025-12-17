import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/entities/user_entity.dart';

part 'trip_home_event.freezed.dart';

@freezed
abstract class TripHomeEvent with _$TripHomeEvent {
  const factory TripHomeEvent.loadTripHome({
    required int tripId,
    required int myId,
  }) = LoadTripHome;

  const factory TripHomeEvent.toggleCrew() = ToggleCrew;

  // 친구 초대 팝업 열기 (친구목록 로드 포함)
  const factory TripHomeEvent.openInvite() = OpenInvite;

  const factory TripHomeEvent.closeInvite() = CloseInvite;

  const factory TripHomeEvent.inviteFriend({required UserEntity friend}) =
      InviteFriend;

  const factory TripHomeEvent.selectDate({required DateTime date}) = SelectDate;
  const factory TripHomeEvent.changeCalendarPage({required int pageIndex}) =
      ChangeCalendarPage;
  const factory TripHomeEvent.refreshSchedules() = RefreshSchedules;

  const factory TripHomeEvent.consumeMessage() = ConsumeMessage;

  const factory TripHomeEvent.consumeAction() = ConsumeAction;

  const factory TripHomeEvent.toggleUsefulPhrase() = ToggleUsefulPhrase;
}
