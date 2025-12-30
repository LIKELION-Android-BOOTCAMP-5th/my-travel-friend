import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_travel_friend/core/service/internal/deep_link_service.dart';

class RouterObserver extends NavigatorObserver {
  void _handleDeepLinkConsumption(Route<dynamic>? route) {
    // 1. 현재 이동하려는 목적지의 이름이나 경로를 가져옵니다.
    final String? location = route?.settings.name;
    if (location == null) return;

    final deepLinkService = GetIt.I<DeepLinkService>();
    final String? pendingPath = deepLinkService.pendingPath;

    // 2. 대기 중인 딥링크가 있고, 현재 경로와 일치한다면 소모합니다.
    if (pendingPath != null && location == pendingPath) {
      print("🏁 [Observer] 목적지 일치 확인 ($location): 딥링크를 소모합니다.");
      deepLinkService.consumePendingPath();
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _handleDeepLinkConsumption(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _handleDeepLinkConsumption(newRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _handleDeepLinkConsumption(route);
  }
}
