import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router.dart';
import '../../viewmodels/permission/permission_bloc.dart';
import '../../viewmodels/permission/permission_event.dart';
import 'permission_screen.dart';

// [이재은] 권한 설정 BlocProvider 위젯
class PermissionBlocWidget extends StatelessWidget {
  const PermissionBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PermissionBloc>()..add(const LoadPermission()),
      child: const PermissionScreen(),
    );
  }
}
