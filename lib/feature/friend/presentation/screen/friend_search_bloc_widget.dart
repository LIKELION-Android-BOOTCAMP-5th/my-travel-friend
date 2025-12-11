// lib/feature/friend/presentation/screen/friend_search_bloc_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DI/injection.dart';
import '../viewmodel/friend_search_bloc.dart';
import '../viewmodel/friend_search_event.dart';
import 'friend_search_screen.dart';

class FriendSearchBlocWidget extends StatelessWidget {
  final int userId; // 내 userId

  const FriendSearchBlocWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = sl<FriendSearchBloc>();
        // 화면 진입 시 내 userId 세팅
        bloc.add(FriendSearchEvent.initialized(myUserId: userId));
        return bloc;
      },
      child: FriendSearchScreen(), // 아래에서 만들 UI 전용 화면
    );
  }
}
