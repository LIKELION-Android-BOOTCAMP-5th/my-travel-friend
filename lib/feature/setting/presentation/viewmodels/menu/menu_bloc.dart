import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'menu_event.dart';
import 'menu_state.dart';

// [이재은] 설정 메뉴 Bloc
@injectable
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(const MenuState()) {
    on<LoadMenu>(_onLoad);
    on<RefreshMenu>(_onRefresh);
  }

  Future<void> _onLoad(LoadMenu event, Emitter<MenuState> emit) async {
    emit(state.copyWith(pageState: MenuPageState.loading));
  }

  Future<void> _onRefresh(RefreshMenu event, Emitter<MenuState> emit) async {}
}
