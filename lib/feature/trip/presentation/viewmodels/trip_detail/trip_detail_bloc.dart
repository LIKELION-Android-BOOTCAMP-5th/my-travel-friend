import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/result/result.dart';
import '../../../domain/usecases/get_trip_by_id_usecase.dart';
import 'trip_detail_event.dart';
import 'trip_detail_state.dart';

// [이재은] Trip 상세 정보 Bloc (ShellRoute에서 사용)
@injectable
class TripDetailBloc extends Bloc<TripDetailEvent, TripDetailState> {
  final GetTripByIdUseCase _getTripByIdUsecase;

  int? _currentTripId;

  TripDetailBloc(this._getTripByIdUsecase) : super(const TripDetailState()) {
    on<LoadTripDetail>(_onLoadTripDetail);
    on<UpdateTripDetail>(_onUpdateTripDetail);
    on<RefreshTripDetail>(_onRefreshTripDetail);
  }

  // Trip 상세 정보 로드
  Future<void> _onLoadTripDetail(
    LoadTripDetail event,
    Emitter<TripDetailState> emit,
  ) async {
    _currentTripId = event.tripId;

    emit(state.copyWith(pageState: TripDetailPageState.loading));

    final result = await _getTripByIdUsecase(event.tripId);

    result.when(
      success: (trip) {
        emit(
          state.copyWith(
            pageState: TripDetailPageState.loaded,
            trip: trip,
            errorMessage: null,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: TripDetailPageState.error,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

  // Trip 정보 업데이트 (설정에서 수정 후)
  Future<void> _onUpdateTripDetail(
    UpdateTripDetail event,
    Emitter<TripDetailState> emit,
  ) async {
    emit(
      state.copyWith(trip: event.trip, pageState: TripDetailPageState.loaded),
    );
  }

  // Trip 새로고침
  Future<void> _onRefreshTripDetail(
    RefreshTripDetail event,
    Emitter<TripDetailState> emit,
  ) async {
    if (_currentTripId == null) return;

    final result = await _getTripByIdUsecase(_currentTripId!);

    result.when(
      success: (trip) {
        emit(
          state.copyWith(
            pageState: TripDetailPageState.loaded,
            trip: trip,
            errorMessage: null,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            pageState: TripDetailPageState.error,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }
}
