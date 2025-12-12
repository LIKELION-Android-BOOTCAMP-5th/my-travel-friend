import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/theme/theme_event.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/theme/theme_state.dart';

import '../../../../../core/result/failures.dart';
import '../../../../../core/result/result.dart';
import '../../../domain/usecases/theme/get_theme_usecase.dart';
import '../../../domain/usecases/theme/update_theme_usecase.dart';

// [이재은] 테마 설정 관련 bloc (전역)
@singleton
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase _getThemeUseCase;
  final UpdateThemeUseCase _updateThemeUseCase;

  ThemeBloc(this._getThemeUseCase, this._updateThemeUseCase)
    : super(const ThemeState.initial()) {
    on<LoadTheme>(_onLoadTheme);
    on<UpdateTheme>(_onUpdateTheme);
  }

  // 현재 ThemeMode 반환 (MaterialApp에서 사용)
  ThemeMode get themeMode {
    return state.maybeWhen(
      loaded: (selectedTheme) => _toThemeMode(selectedTheme),
      orElse: () => ThemeMode.system,
    );
  }

  // 테마 불러오기
  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    emit(const ThemeState.loading());

    final res = _getThemeUseCase();

    res.when(
      success: (theme) {
        emit(ThemeState.loaded(selectedTheme: theme));
      },
      failure: (failure) {
        final message = failure.when(
          serverFailure: (msg) => msg,
          networkFailure: (msg) => msg,
          authFailure: (msg) => msg,
          undefined: (msg) => msg,
        );
        emit(ThemeState.error(message: message));
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
        emit(ThemeState.loaded(selectedTheme: event.type));
      },
      failure: (failure) {
        final message = failure.when(
          serverFailure: (msg) => msg,
          networkFailure: (msg) => msg,
          authFailure: (msg) => msg,
          undefined: (msg) => msg,
        );
        emit(ThemeState.error(message: message));
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
