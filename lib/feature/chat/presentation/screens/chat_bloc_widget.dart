import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../viewmodels/chat_bloc.dart';
import '../viewmodels/chat_event.dart';
import 'chat_screen.dart';

// [이재은] 채팅 BlocWidget

class ChatBlocWidget extends StatefulWidget {
  final int tripId;

  const ChatBlocWidget({super.key, required this.tripId});

  @override
  State<ChatBlocWidget> createState() => _ChatBlocWidgetState();
}

class _ChatBlocWidgetState extends State<ChatBlocWidget> {
  late final ChatBloc _chatBloc;

  @override
  void initState() {
    super.initState();
    _chatBloc = GetIt.instance<ChatBloc>();

    final authState = context.read<AuthProfileBloc>().state;
    if (authState is AuthProfileAuthenticated) {
      final userId = authState.userInfo.id!;
      _chatBloc.add(EnterChat(tripId: widget.tripId, userId: userId));
    }
  }

  @override
  void dispose() {
    _chatBloc.add(const LeaveChat());
    _chatBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthProfileBloc>().state;

    if (authState is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    return BlocProvider.value(
      value: _chatBloc,
      child: ChatScreen(tripId: widget.tripId),
    );
  }
}
