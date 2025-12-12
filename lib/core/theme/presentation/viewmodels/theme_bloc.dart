import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/theme/presentation/viewmodels/theme_event.dart';
import 'package:my_travel_friend/core/theme/presentation/viewmodels/theme_state.dart';

import '../../../result/failures.dart';
import '../../../result/result.dart';
import '../../domain/usecases/get_theme_usecase.dart';
import '../../domain/usecases/update_theme_usecase.dart';

// [이재은] 테마 설정 관련 bloc (전역)
@singleton
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase _getThemeUseCase;
  final UpdateThemeUseCase _updateThemeUseCase;

  ThemeBloc(this._getThemeUseCase, this._updateThemeUseCase)
    : super(const ThemeState()) {
    on<LoadTheme>(_onLoadTheme);
    on<UpdateTheme>(_onUpdateTheme);
  }

  // 현재 ThemeMode 반환
  ThemeMode get themeMode => _toThemeMode(state.selectedTheme);

  // 테마 불러오기
  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    emit(state.copyWith(pageState: ThemePageState.loading));

    final res = await _getThemeUseCase();

    res.when(
      success: (theme) {
        emit(
          state.copyWith(
            pageState: ThemePageState.loaded,
            selectedTheme: theme,
          ),
        );
      },
      failure: (failure) {
        final message = failure.when(
          serverFailure: (msg) => msg,
          networkFailure: (msg) => msg,
          authFailure: (msg) => msg,
          undefined: (msg) => msg,
        );
        emit(state.copyWith(pageState: ThemePageState.error, message: message));
      },
    );
  }

  // 테마 변경
  Future<void> _onUpdateTheme(
    UpdateTheme event,
    Emitter<ThemeState> emit,
  ) async {
    final res = await _updateThemeUseCase(event.type);

    res.when(
      success: (_) {
        emit(state.copyWith(selectedTheme: event.type));
      },
      failure: (failure) {
        final message = failure.when(
          serverFailure: (msg) => msg,
          networkFailure: (msg) => msg,
          authFailure: (msg) => msg,
          undefined: (msg) => msg,
        );
        emit(state.copyWith(message: message));
      },
    );
  }

  // AppThemeType → ThemeMode 변환
  ThemeMode _toThemeMode(AppThemeType type) {
    switch (type) {
      case AppThemeType.light:
        return ThemeMode.light;
      case AppThemeType.dark:
        return ThemeMode.dark;
      case AppThemeType.system:
        return ThemeMode.system;
    }
  }
}
