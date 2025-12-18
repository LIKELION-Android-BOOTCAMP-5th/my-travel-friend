import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/trip/domain/usecases/add_trip_usecase.dart';
import 'package:my_travel_friend/feature/trip/domain/usecases/get_trip_by_id_usecase.dart';
import 'package:my_travel_friend/feature/trip/domain/usecases/get_trip_request_usecase.dart';

import '../../../domain/entities/trip_entity.dart';
import '../../../domain/usecases/accept_trip_request_usecase.dart';
import '../../../domain/usecases/create_trip_request_usecase.dart';
import '../../../domain/usecases/delete_trip_request_usecase.dart';
import 'trip_request_event.dart';
import 'trip_request_state.dart';

@injectable
class TripRequestBloc extends Bloc<TripRequestEvent, TripRequestState> {
  final CreateTripRequestUsecase _createUsecase;
  final AcceptTripRequestUsecase _acceptUsecase;
  final DeleteTripRequestUsecase _deleteUsecase;
  final AddTripUsecase _addTripUsecase;
  final GetTripRequestUsecase _getTripRequestUsecase;
  final GetTripByIdUseCase _getTripByIdUseCase;

  TripRequestBloc(
    this._createUsecase,
    this._acceptUsecase,
    this._deleteUsecase,
    this._addTripUsecase,
    this._getTripRequestUsecase,
    this._getTripByIdUseCase,
  ) : super(const TripRequestState()) {
    on<CreateTripRequest>(_onCreateTripRequest);
    on<AcceptTripRequest>(_onAcceptTripRequest);
    on<DeleteTripRequest>(_onDeleteTripRequest);
    on<GetTripRequest>(_onGetTripRequest);
  }

  // 조회
  Future<void> _onGetTripRequest(
    GetTripRequest event,
    Emitter<TripRequestState> emit,
  ) async {
    emit(state.copyWith(pageState: TripRequestPageState.loading));

    final result = await _getTripRequestUsecase(event.myId);

    await result.when(
      success: (requests) async {
        // 요청 목록 저장
        // tripId만 뽑아서 중복 제거
        final tripIds = requests
            .map((e) => e.tripId)
            .whereType<int>()
            .toSet()
            .toList();

        // tripId로 하나 조회해서 invitedTrips 만들기
        final fetchedTrips = <TripEntity>[];

        for (final tripId in tripIds) {
          final tripRes = await _getTripByIdUseCase(tripId);

          tripRes.when(
            success: (trip) {
              fetchedTrips.add(trip);
            },
            failure: (f) {
              debugPrint('❌ getTripById 실패 tripId=$tripId / ${f.message}');
            },
          );
        }

        emit(
          state.copyWith(
            tripRequests: requests,
            invitedTrips: fetchedTrips,
            pageState: TripRequestPageState.loaded,
          ),
        );
      },
      failure: (f) async {
        emit(
          state.copyWith(
            pageState: TripRequestPageState.error,
            message: f.message,
          ),
        );
      },
    );
  }

  // 여행 초대 보내기
  Future<void> _onCreateTripRequest(
    CreateTripRequest event,
    Emitter<TripRequestState> emit,
  ) async {
    emit(state.copyWith(pageState: TripRequestPageState.loading));

    final result = await _createUsecase(
      event.requestId,
      event.targetId,
      event.tripId,
    );

    result.when(
      success: (_) {
        emit(
          state.copyWith(
            pageState: TripRequestPageState.success,
            message: '여행 초대를 보냈어요',
            actionType: 'create',
          ),
        );
      },
      failure: (f) {
        emit(
          state.copyWith(
            pageState: TripRequestPageState.error,
            message: f.message,
            actionType: 'create',
          ),
        );
      },
    );
  }

  // 요청 수락
  Future<void> _onAcceptTripRequest(
    AcceptTripRequest event,
    Emitter<TripRequestState> emit,
  ) async {
    emit(state.copyWith(pageState: TripRequestPageState.loading));

    // answered_at 업데이트
    final acceptRes = await _acceptUsecase(event.requestId);

    await acceptRes.when(
      success: (_) async {
        // trip_crew insert
        final addRes = await _addTripUsecase(event.myUserId, event.tripId);

        addRes.when(
          success: (_) {
            // 카드 제거 + success
            final updated = [...state.tripRequests]
              ..removeWhere((r) => r.id == event.requestId);

            emit(
              state.copyWith(
                tripRequests: updated,
                pageState: TripRequestPageState.success,
                actionType: 'accept',
                message: '여행 초대를 수락했어요',
              ),
            );
          },
          failure: (f) {
            final msg = f.message.toLowerCase();
            final isDuplicate =
                msg.contains('duplicate') ||
                msg.contains('already exists') ||
                msg.contains('unique constraint');

            if (isDuplicate) {
              // 이미 멤버면 성공 처리
              final updated = [...state.tripRequests]
                ..removeWhere((r) => r.id == event.requestId);

              emit(
                state.copyWith(
                  tripRequests: updated,
                  pageState: TripRequestPageState.success,
                  actionType: 'accept',
                  message: '이미 참여 중인 여행이에요',
                ),
              );
              return;
            }

            emit(
              state.copyWith(
                pageState: TripRequestPageState.error,
                actionType: 'add_failed',
                message: f.message,
              ),
            );
          },
        );
      },
      failure: (f) async {
        emit(
          state.copyWith(
            pageState: TripRequestPageState.error,
            actionType: 'accept_failed',
            message: f.message,
          ),
        );
      },
    );
  }

  // 요청 거절
  Future<void> _onDeleteTripRequest(
    DeleteTripRequest event,
    Emitter<TripRequestState> emit,
  ) async {
    emit(state.copyWith(pageState: TripRequestPageState.loading));

    final result = await _deleteUsecase(event.id);

    result.when(
      success: (_) {
        emit(
          state.copyWith(
            pageState: TripRequestPageState.success,
            message: '초대를 거절했어요',
            actionType: 'delete',
          ),
        );
      },
      failure: (f) {
        emit(
          state.copyWith(
            pageState: TripRequestPageState.error,
            message: f.message,
            actionType: 'delete',
          ),
        );
      },
    );
  }
}
