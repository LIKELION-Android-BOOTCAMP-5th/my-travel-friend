import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'deep_link_service.dart';

@lazySingleton
class AppLinkService {
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _sub;

  Future<void> init() async {
    final deepLinkService = GetIt.I<DeepLinkService>();

    // 1) 앱 완전 종료 상태에서 켜진 경우
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      deepLinkService.navigateFromInviteLink(initialUri);
    }

    // 2) 앱 실행 중/백그라운드에서 링크 클릭
    _sub = _appLinks.uriLinkStream.listen((uri) {
      debugPrint('[app_links] $uri');
      GetIt.I<DeepLinkService>().navigateFromInviteLink(uri);
    });
  }

  void dispose() => _sub?.cancel();
}
