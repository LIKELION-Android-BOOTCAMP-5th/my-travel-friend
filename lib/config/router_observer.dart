import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/config/router.dart';
import 'package:my_travel_friend/core/service/internal/deep_link_service.dart';

class RouterObserver extends NavigatorObserver {
  void _handleDeepLinkConsumption() {
    final router = AppRouter.instance.router;

    // 현재 GoRouter의 실제 절대 경로(URI) 추출
    final String currentLocation = router
        .routerDelegate
        .currentConfiguration
        .uri
        .toString();

    final deepLinkService = GetIt.I<DeepLinkService>();
    final String? pendingPath = deepLinkService.pendingPath;

    print("[Observer] 현재 실제 경로: $currentLocation / 대기중: $pendingPath");

    //경로가 일치할 때만 소모
    if (pendingPath != null && currentLocation == pendingPath) {
      print("[Observer] 목적지 도착 확인! 딥링크 소모");
      deepLinkService.consumePendingPath();
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _handleDeepLinkConsumption();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _handleDeepLinkConsumption();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _handleDeepLinkConsumption();
  }
}
