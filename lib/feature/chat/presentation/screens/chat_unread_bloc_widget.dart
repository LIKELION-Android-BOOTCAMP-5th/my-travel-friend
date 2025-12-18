import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router.dart';
import '../viewmodels/chat_unread/chat_unread_bloc.dart';

// [이재은] ChatUnreadBloc 제공 위젯

class ChatUnreadBlocWidget extends StatelessWidget {
  final Widget child;

  const ChatUnreadBlocWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => getIt<ChatUnreadBloc>(), child: child);
  }
}
