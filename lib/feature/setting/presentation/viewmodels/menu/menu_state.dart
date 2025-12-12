import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.freezed.dart';

// [이재은] 설정 메뉴 state

enum MenuPageState { initial, loading, loaded, error }

@freezed
abstract class MenuState with _$MenuState {
  const MenuState._();

  const factory MenuState({
    @Default(MenuPageState.initial) MenuPageState pageState,
    // @Default(0) int friendReceiveCount,
    // @Default(0) int travelReceiveCount,
    String? message,
  }) = _MenuState;
}
