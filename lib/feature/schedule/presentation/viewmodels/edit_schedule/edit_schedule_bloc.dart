import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/extension/failure_extension.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:my_travel_friend/feature/schedule/domain/usecases/get_schedule_member_usecase.dart';

import '../../../domain/entities/schedule_entity.dart';
import '../../../domain/usecases/edit_schedule_usecase.dart';
import '../../../domain/usecases/get_trip_member_usecase.dart';
import 'edit_schedule_event.dart';
import 'edit_schedule_state.dart';

@injectable
class EditScheduleBloc extends Bloc<EditScheduleEvent, EditScheduleState> {
  final UpdateScheduleUseCase _updateScheduleUseCase;
  final GetTripMembersUseCase _getTripMembersUseCase;
  final GetScheduleMembersUseCase _getScheduleMembersUseCase;

  EditScheduleBloc(
    this._updateScheduleUseCase,
    this._getTripMembersUseCase,
    this._getScheduleMembersUseCase,
  ) : super(const EditScheduleState()) {
    on<Initialized>(_onInitialized);
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
    on<LoadScheduleMembers>(_onLoadScheduleMembers);
  }

  // ===============================
  // util
  // ===============================

  DateTime? _combineDateTime(DateTime? date, TimeOfDay? time) {
    if (date == null || time == null) return null;
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  bool _validate(EditScheduleState state) {
    return (state.title?.isNotEmpty ?? false) &&
        state.date != null &&
        state.time != null &&
        state.selectedCategoryId != null &&
        state.selectedScheduleCrew.isNotEmpty;
  }

  // ===============================
  // 초기화
  // ===============================

  void _onInitialized(Initialized event, Emitter<EditScheduleState> emit) {
    final s = event.schedule;

    final parsedDateTime = DateTime.parse(s.date);
    final date = DateTime(
      parsedDateTime.year,
      parsedDateTime.month,
      parsedDateTime.day,
    );
    final time = TimeOfDay.fromDateTime(parsedDateTime);

    emit(
      state.copyWith(
        scheduleId: s.id!,
        tripId: s.tripId,
        originalSchedule: s,
        title: s.title,
        description: s.description,
        date: date,
        time: time,
        startAt: parsedDateTime,
        place: s.place,
        address: s.address,
        lat: s.lat,
        lng: s.lng,
        isPlaceFromMap: s.lat != null && s.lng != null,
        selectedCategoryId: s.categoryId,
        selectedScheduleCrew: const [],
        isDirty: false,
        isValid: true,
        pageState: EditSchedulePageState.loaded,
      ),
    );
    add(const EditScheduleEvent.loadScheduleMembers());

    add(const EditScheduleEvent.loadTripMembers());
  }

  Future<void> _onLoadScheduleMembers(
    LoadScheduleMembers event,
    Emitter<EditScheduleState> emit,
  ) async {
    final res = await _getScheduleMembersUseCase(scheduleId: state.scheduleId!);

    res.when(
      success: (members) {
        final next = state.copyWith(selectedScheduleCrew: members);

        emit(next.copyWith(isValid: _validate(next)));
      },
      failure: (e) {
        emit(
          state.copyWith(
            pageState: EditSchedulePageState.error,
            message: e.message,
            errorType: e.errorType,
          ),
        );
      },
    );
  }

  // ===============================
  // 입력 처리
  // ===============================

  void _onTitleChanged(TitleChanged event, Emitter<EditScheduleState> emit) {
    final next = state.copyWith(title: event.title, isDirty: true);
    emit(next.copyWith(isValid: _validate(next)));
  }

  void _onDescriptionChanged(
    DescriptionChanged event,
    Emitter<EditScheduleState> emit,
  ) {
    emit(state.copyWith(description: event.description, isDirty: true));
  }

  void _onDateSelected(DateSelected event, Emitter<EditScheduleState> emit) {
    final startAt = _combineDateTime(event.date, state.time);
    final next = state.copyWith(
      date: event.date,
      startAt: startAt,
      isDirty: true,
    );
    emit(next.copyWith(isValid: _validate(next)));
  }

  void _onTimeSelected(TimeSelected event, Emitter<EditScheduleState> emit) {
    final startAt = _combineDateTime(state.date, event.time);
    final next = state.copyWith(
      time: event.time,
      startAt: startAt,
      isDirty: true,
    );
    emit(next.copyWith(isValid: _validate(next)));
  }

  // ===============================
  // 장소
  // ===============================

  void _onPlaceTextChanged(
    PlaceTextChanged event,
    Emitter<EditScheduleState> emit,
  ) {
    final text = event.text.trim();

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

    emit(
      state.copyWith(
        place: text,
        address: null,
        lat: null,
        lng: null,
        isPlaceFromMap: false,
        isDirty: true,
      ),
    );
  }

  void _onPlaceSelected(PlaceSelected event, Emitter<EditScheduleState> emit) {
    emit(
      state.copyWith(
        place: event.place,
        address: event.address,
        lat: event.lat,
        lng: event.lng,
        isPlaceFromMap: true,
        isDirty: true,
      ),
    );
  }

  void _onPlaceCleared(PlaceCleared event, Emitter<EditScheduleState> emit) {
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
  // 카테고리
  // ===============================

  void _onCategorySelected(
    CategorySelected event,
    Emitter<EditScheduleState> emit,
  ) {
    final next = state.copyWith(
      selectedCategoryId: event.categoryId,
      isDirty: true,
    );
    emit(next.copyWith(isValid: _validate(next)));
  }

  // ===============================
  // 참여자
  // ===============================

  Future<void> _onLoadTripMembers(
    LoadTripMembers event,
    Emitter<EditScheduleState> emit,
  ) async {
    final result = await _getTripMembersUseCase(tripId: state.tripId!);

    result.when(
      success: (members) {
        emit(state.copyWith(tripMembers: members));
      },
      failure: (e) {
        emit(
          state.copyWith(
            pageState: EditSchedulePageState.error,
            message: e.message,
            errorType: e.errorType,
          ),
        );
      },
    );
  }

  void _onCrewAdded(CrewAdded event, Emitter<EditScheduleState> emit) {
    if (state.selectedScheduleCrew.any((e) => e.id == event.user.id)) return;

    final next = state.copyWith(
      selectedScheduleCrew: [...state.selectedScheduleCrew, event.user],
      isDirty: true,
    );
    emit(next.copyWith(isValid: _validate(next)));
  }

  void _onCrewRemoved(CrewRemoved event, Emitter<EditScheduleState> emit) {
    final next = state.copyWith(
      selectedScheduleCrew: state.selectedScheduleCrew
          .where((e) => e.id != event.userId)
          .toList(),
      isDirty: true,
    );
    emit(next.copyWith(isValid: _validate(next)));
  }

  // ===============================
  // 수정
  // ===============================

  Future<void> _onSubmitPressed(
    SubmitPressed event,
    Emitter<EditScheduleState> emit,
  ) async {
    if (!state.isValid || state.isSubmitting) return;

    emit(
      state.copyWith(
        isSubmitting: true,
        pageState: EditSchedulePageState.loading,
      ),
    );

    final schedule = ScheduleEntity(
      id: state.scheduleId,
      tripId: state.tripId!,
      title: state.title!,
      date: state.startAt!.toUtc().toIso8601String(),
      place: state.place,
      address: state.isPlaceFromMap ? state.address : null,
      lat: state.isPlaceFromMap ? state.lat : null,
      lng: state.isPlaceFromMap ? state.lng : null,
      description: state.description,
      categoryId: state.selectedCategoryId!,
    );

    final memberIds = state.selectedScheduleCrew.map((e) => e.id!).toList();

    final result = await _updateScheduleUseCase(
      schedule: schedule,
      memberIds: memberIds,
    );

    result.when(
      success: (_) {
        emit(
          state.copyWith(
            isSubmitting: false,
            pageState: EditSchedulePageState.success,
            actionType: 'edit_schedule',
            message: '일정이 수정되었어요',
          ),
        );
      },
      failure: (e) {
        emit(
          state.copyWith(
            isSubmitting: false,
            pageState: EditSchedulePageState.error,
            message: e.message,
            errorType: e.errorType,
          ),
        );
      },
    );
  }

  // ===============================
  // 나가기
  // ===============================

  void _onExitRequested(ExitRequested event, Emitter<EditScheduleState> emit) {
    if (state.isDirty) {
      emit(
        state.copyWith(
          message: '변경사항이 있어요. 나가시겠어요?',
          actionType: 'exit_confirm',
        ),
      );
    } else {
      emit(state.copyWith(actionType: 'pop'));
    }
  }

  void _onExitConfirmed(ExitConfirmed event, Emitter<EditScheduleState> emit) {
    emit(state.copyWith(actionType: 'pop'));
  }

  void _onClearMessage(ClearMessage event, Emitter<EditScheduleState> emit) {
    emit(state.copyWith(message: null, errorType: null, actionType: null));
  }
}
