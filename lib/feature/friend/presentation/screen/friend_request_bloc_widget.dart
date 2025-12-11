import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travel_friend/feature/friend/presentation/viewmodel/friend_request_bloc.dart';

import '../../../../core/DI/injection.dart';
import 'friend_request_screen.dart';

/// [엄수빈] 친구 추가 / 친구 요청 Bloc 위젯 (라우팅용)
class FriendRequestBlocWidget extends StatelessWidget {
  final int requestId;

  const FriendRequestBlocWidget({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<FriendRequestBloc>(),
      child: FriendRequestScreen(requestId: requestId),
    );
  }
}
