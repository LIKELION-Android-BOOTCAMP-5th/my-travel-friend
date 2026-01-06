import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widget/toast_pop.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../viewmodel/friend_request_bloc.dart';
import '../viewmodel/friend_request_event.dart';

class FriendReceviceInvite extends StatefulWidget {
  final Widget child;
  const FriendReceviceInvite({super.key, required this.child});

  @override
  State<FriendReceviceInvite> createState() => _FriendReceiveInviteState();
}

class _FriendReceiveInviteState extends State<FriendReceviceInvite> {
  bool _done = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_done) return;
    _done = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final uri = GoRouterState.of(context).uri;
      final fromId = int.tryParse(uri.queryParameters['from'] ?? '');

      // from 없으면 아무 것도 안 함
      if (fromId == null || fromId == 0) return;

      // 로그인한 내 id
      final authState = context.read<AuthProfileBloc>().state;
      if (authState is! AuthProfileAuthenticated) return;

      final myId = authState.userInfo.id!;
      if (myId == 0) return;

      // ✅ requestId = 나, targetId = 링크 보낸 사람(from)
      context.read<FriendRequestBloc>().add(
        FriendRequestEvent.createFriendRequest(
          requestId: myId,
          targetId: fromId,
        ),
      );

      ToastPop.show('친구 추가가 요청되었습니다!');
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
