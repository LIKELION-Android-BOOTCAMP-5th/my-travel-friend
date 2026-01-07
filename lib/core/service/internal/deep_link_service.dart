import 'package:flutter/material.dart'; // ChangeNotifier를 위해 필요
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../../../feature/friend/presentation/viewmodel/friend_request_bloc.dart';
import '../../../feature/friend/presentation/viewmodel/friend_request_event.dart';

@lazySingleton
class DeepLinkService extends ChangeNotifier {
  String? _pendingPath;
  String? get pendingPath => _pendingPath;

  //저장된 딥링크 경로를 소모
  String? consumePendingPath() {
    if (_pendingPath == null) return null;

    print("[DeepLinkService] 경로 소모됨: $_pendingPath");
    final path = _pendingPath;
    _pendingPath = null;
    return path;
  }

  // 경로세팅 후 알림
  void navigateFromNotification(
    String alarmType,
    Map<String, dynamic> deeplinkData,
  ) {
    final String targetRoute = _generateRoute(alarmType, deeplinkData);
    print("[DeepLinkService] 새로운 경로 감지: $targetRoute");

    _pendingPath = targetRoute;

    notifyListeners();
  }

  //경로 지정
  String _generateRoute(String alarmType, Map<String, dynamic> deepLinkData) {
    switch (alarmType) {
      case 'TRIP_REQUEST':
        return '/home/setting/receive_trip';
      case 'FRIEND_REQUEST':
        return "/home/setting/friend-receive";
      case 'NEW_FRIEND':
        return "/home/setting/friend";
      case 'SCHEDULE_EDITED':
      case 'SCHEDULE_ADDED':
      case 'SCHEDULE_DELETED':
        return "/home/trip/${deepLinkData["trip_id"]}/schedule";
      case 'TALK_MESSAGE':
        return "/home/trip/${deepLinkData["trip_id"]}/talk";
      case 'D_DAY':
        return "/home/trip/${deepLinkData["trip_id"]}/trip_home";
      case 'WIDGET_TRIP':
        return "/home/trip/${deepLinkData["trip_id"]}/trip_home";
      case 'WIDGET_SCHEDULE':
        return "/home/trip/${deepLinkData["trip_id"]}/schedule";
      default:
        return '/home';
    }
  }

  // 친구 초대 링크 처리
  void navigateFromInviteLink(Uri uri) {
    final fromId = int.tryParse(uri.queryParameters['from'] ?? '');
    if (fromId == null || fromId == 0) {
      return;
    }

    final authState = GetIt.I<AuthProfileBloc>().state;
    if (authState is! AuthProfileAuthenticated) {
      return;
    }

    final myId = authState.userInfo.id!;

    if (fromId == myId) {
      debugPrint('[Skip] 내 아이디 진입 제거 : fromId=$fromId myId=$myId');
      return;
    }

    GetIt.I<FriendRequestBloc>().add(
      FriendRequestEvent.requestCreate(requestId: myId, targetId: fromId),
    );
    navigateFromNotification('NEW_FRIEND', {});
  }
}
