import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../viewmodels/menu/menu_bloc.dart';
import '../../viewmodels/menu/menu_event.dart';
import 'menu_screen.dart';

// [이재은] 설정 메뉴 Bloc 위젯
class MenuBlocWidget extends StatelessWidget {
  const MenuBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<MenuBloc>()..add(const LoadMenu()),
      child: const MenuScreen(),
    );
  }
}
