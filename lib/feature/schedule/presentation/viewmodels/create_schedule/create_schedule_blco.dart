import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/extension/failure_extension.dart';
import 'package:my_travel_friend/core/result/result.dart';

import '../../../domain/entities/schedule_entity.dart';
import '../../../domain/usecases/create_schedule_usecase.dart';
import '../../../domain/usecases/get_trip_member_usecase.dart';
import 'create_schedule_event.dart';
import 'create_schedule_state.dart';

@injectable
class CreateScheduleBloc
    extends Bloc<CreateScheduleEvent, CreateScheduleState> {
  final CreateScheduleUseCase _createScheduleUseCase;
  final GetTripMembersUseCase _getTripMembersUseCase;

  CreateScheduleBloc(this._createScheduleUseCase, this._getTripMembersUseCase)
    : super(CreateScheduleState()) {
    on<TitleChanged>(_onTitleChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<DateSelected>(_onDateSelected);
    on<TimeSelected>(_onTimeSelected);
    on<PlaceTextChanged>(_onPlaceTextChanged);
    on<PlaceSelected>(_onPlaceSelected);
    on<PlaceCleared>(_onPlaceCleared);
    on<CategorySelected>(_onCategorySelected);
    on<LoadTripMembers>(_onLoadTripMembers);
    on<CrewAdded>(_onCrewAdded);
    on<CrewRemoved>(_onCrewRemoved);
    on<SubmitPressed>(_onSubmitPressed);
    on<ExitRequested>(_onExitRequested);
    on<ExitConfirmed>(_onExitConfirmed);
    on<ClearMessage>(_onClearMessage);
  }

  // ===============================
  // 🔧 공통 유틸
  // ===============================

  DateTime? _combineDateTime(DateTime? date, TimeOfDay? time) {
    if (date == null || time == null) return null;
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  bool _validate(CreateScheduleState state) {
    return (state.title?.isNotEmpty ?? false) &&
        state.date != null &&
        state.time != null &&
        state.selectedCategoryId != null &&
        state.selectedScheduleCrew.isNotEmpty;
  }

  // ===============================
  // ✏️ 입력
  // ===============================

  void _onTitleChanged(TitleChanged event, Emitter<CreateScheduleState> emit) {
    final next = state.copyWith(title: event.title, isDirty: true);

    emit(next.copyWith(isValid: _validate(next)));
  }

  void _onDescriptionChanged(
    DescriptionChanged event,
    Emitter<CreateScheduleState> emit,
  ) {
    emit(state.copyWith(description: event.description, isDirty: true));
  }

  void _onPlaceTextChanged(
    PlaceTextChanged event,
    Emitter<CreateScheduleState> emit,
  ) {
    final text = event.text.trim();

    // 🔥 전부 지운 경우 → 장소 완전 초기화
    if (text.isEmpty) {
      emit(
        state.copyWith(
          place: null,
          address: null,
          lat: null,
          lng: null,
          isPlaceFromMap: false,
          isDirty: true,
        ),
      );
      return;
    }

    // ✍️ 직접 타이핑 → place만 유지
    emit(
      state.copyWith(
        place: text,
        address: null,
        lat: null,
        lng: null,
        isPlaceFromMap: false, // 🔥 타이핑
        isDirty: true,
      ),
    );
  }
  // ===============================
  // 📅 날짜 / 시간
  // ===============================

  void _onDateSelected(DateSelected event, Emitter<CreateScheduleState> emit) {
    final startAt = _combineDateTime(event.date, state.time);

    final next = state.copyWith(
      date: event.date,
      startAt: startAt,
      isDirty: true,
    );

    emit(next.copyWith(isValid: _validate(next)));
  }

  void _onTimeSelected(TimeSelected event, Emitter<CreateScheduleState> emit) {
    final startAt = _combineDateTime(state.date, event.time);

    final next = state.copyWith(
      time: event.time,
      startAt: startAt,
      isDirty: true,
    );

    emit(next.copyWith(isValid: _validate(next)));
  }

  // ===============================
  // 📍 장소
  // ===============================

  void _onPlaceSelected(
    PlaceSelected event,
    Emitter<CreateScheduleState> emit,
  ) {
    emit(
      state.copyWith(
        place: event.place,
        address: event.address,
        lat: event.lat,
        lng: event.lng,
        isPlaceFromMap: true, // 🔥 지도 검색
        isDirty: true,
      ),
    );
  }

  void _onPlaceCleared(PlaceCleared event, Emitter<CreateScheduleState> emit) {
    emit(
      state.copyWith(
        place: null,
        address: null,
        lat: null,
        lng: null,
        isPlaceFromMap: false,
        isDirty: true,
      ),
    );
  }

  // ===============================
  // 🏷️ 카테고리
  // ===============================

  void _onCategorySelected(
    CategorySelected event,
    Emitter<CreateScheduleState> emit,
  ) {
    final next = state.copyWith(
      selectedCategoryId: event.categoryId,
      isDirty: true,
    );

    emit(next.copyWith(isValid: _validate(next)));
  }

  // ===============================
  // 👥 참여자
  // ===============================
  Future<void> _onLoadTripMembers(
    LoadTripMembers event,
    Emitter<CreateScheduleState> emit,
  ) async {
    emit(state.copyWith(pageState: CreateSchedulepageState.loading));

    final result = await _getTripMembersUseCase(tripId: state.tripId);

    result.when(
      success: (members) {
        emit(
          state.copyWith(
            tripMembers: members,
            pageState: CreateSchedulepageState.loaded,
          ),
        );
      },
      failure: (e) {
        emit(
          state.copyWith(
            pageState: CreateSchedulepageState.error,
            message: e.message,
            errorType: e.errorType,
          ),
        );
      },
    );
  }

  void _onCrewAdded(CrewAdded event, Emitter<CreateScheduleState> emit) {
    if (state.selectedScheduleCrew.any((e) => e.id == event.user.id)) return;

    final next = state.copyWith(
      selectedScheduleCrew: [...state.selectedScheduleCrew, event.user],
      isDirty: true,
    );

    emit(next.copyWith(isValid: _validate(next)));
  }

  void _onCrewRemoved(CrewRemoved event, Emitter<CreateScheduleState> emit) {
    final next = state.copyWith(
      selectedScheduleCrew: state.selectedScheduleCrew
          .where((e) => e.id != event.userId)
          .toList(),
      isDirty: true,
    );

    emit(next.copyWith(isValid: _validate(next)));
  }

  // ===============================
  // 💾 일정 생성
  // ===============================

  Future<void> _onSubmitPressed(
    SubmitPressed event,
    Emitter<CreateScheduleState> emit,
  ) async {
    if (!state.isValid || state.isSubmitting) return;

    emit(
      state.copyWith(
        isSubmitting: true,
        pageState: CreateSchedulepageState.loading,
        message: null,
        errorType: null,
      ),
    );

    final schedule = ScheduleEntity(
      tripId: state.tripId,
      title: state.title!,
      date: state.startAt!.toIso8601String(),
      place: state.place,
      address: state.isPlaceFromMap ? state.address : null,
      lat: state.isPlaceFromMap ? state.lat : null,
      lng: state.isPlaceFromMap ? state.lng : null,
      description: state.description,
      categoryId: state.selectedCategoryId!,
    );

    final memberIds = state.selectedScheduleCrew.map((e) => e.id!).toList();

    final result = await _createScheduleUseCase(
      schedule: schedule,
      memberIds: memberIds,
    );

    result.when(
      success: (_) {
        emit(
          state.copyWith(
            isSubmitting: false,
            pageState: CreateSchedulepageState.success,
            message: '일정이 생성되었어요!',
            actionType: 'create_schedule',
          ),
        );
      },
      failure: (e) {
        emit(
          state.copyWith(
            isSubmitting: false,
            pageState: CreateSchedulepageState.error,
            message: e.message ?? '일정 생성에 실패했어요!',
            errorType: e.errorType ?? 'create_schedule_error',
          ),
        );
      },
    );
  }

  // ===============================
  // 🚪 나가기
  // ===============================

  void _onExitRequested(
    ExitRequested event,
    Emitter<CreateScheduleState> emit,
  ) {
    if (state.isDirty) {
      emit(
        state.copyWith(message: '저장하지 않고 나가시겠어요?', actionType: 'exit_confirm'),
      );
    } else {
      emit(state.copyWith(actionType: 'pop'));
    }
  }

  void _onExitConfirmed(
    ExitConfirmed event,
    Emitter<CreateScheduleState> emit,
  ) {
    emit(state.copyWith(actionType: 'pop'));
  }

  // ===============================
  // 🧼 메시지 초기화
  // ===============================

  void _onClearMessage(ClearMessage event, Emitter<CreateScheduleState> emit) {
    emit(state.copyWith(message: null, errorType: null, actionType: null));
  }
}
