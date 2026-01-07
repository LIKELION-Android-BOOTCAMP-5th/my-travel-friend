import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../feature/auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../../../feature/friend/presentation/viewmodel/friend_request_bloc.dart';
import '../../../feature/friend/presentation/viewmodel/friend_request_event.dart';

@lazySingleton
class DeepLinkService extends ChangeNotifier {
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _sub;

  String? _pendingPath;
  String? get pendingPath => _pendingPath;

  Future<void> init() async {
    // 1) 앱 완전 종료 상태에서 링크로 켜진 경우
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      debugPrint('[DeepLinkService] initial link = $initialUri');
      _handleUri(initialUri);
    }

    // 2) 앱 실행 중 / 백그라운드에서 링크 클릭
    _sub = _appLinks.uriLinkStream.listen((uri) {
      debugPrint('[DeepLinkService] stream link = $uri');
      _handleUri(uri);
    });
  }

  void dispose() {
    _sub?.cancel();
  }

  void _handleUri(Uri uri) {
    // 친구 초대 링크
    if (uri.scheme == 'mytravelfriend') {
      navigateFromInviteLink(uri);
      return;
    }
  }

  String? consumePendingPath() {
    if (_pendingPath == null) return null;
    final path = _pendingPath;
    _pendingPath = null;
    return path;
  }

  void navigateFromNotification(
    String alarmType,
    Map<String, dynamic> deeplinkData,
  ) {
    final String targetRoute = _generateRoute(alarmType, deeplinkData);
    _pendingPath = targetRoute;
    notifyListeners();
  }

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
      case 'WIDGET_TRIP':
        return "/home/trip/${deepLinkData["trip_id"]}/trip_home";
      case 'WIDGET_SCHEDULE':
        return "/home/trip/${deepLinkData["trip_id"]}/schedule";
      default:
        return '/home';
    }
  }

  /* ------------------------------------------------------------------
   *  🔹 친구 초대 링크 처리
   *    mytravelfriend://invite/friend?from=13
   * ------------------------------------------------------------------ */
  void navigateFromInviteLink(Uri uri) {
    final fromId = int.tryParse(uri.queryParameters['from'] ?? '');
    if (fromId == null || fromId == 0) {
      debugPrint('[DeepLinkService] invalid fromId');
      return;
    }

    final authState = GetIt.I<AuthProfileBloc>().state;
    if (authState is! AuthProfileAuthenticated) {
      debugPrint('[DeepLinkService] not authenticated yet');
      return;
    }

    final myId = authState.userInfo.id!;
    debugPrint('[DeepLinkService] send friend request $myId -> $fromId');

    GetIt.I<FriendRequestBloc>().add(
      FriendRequestEvent.requestCreate(requestId: myId, targetId: fromId),
    );
  }
}
