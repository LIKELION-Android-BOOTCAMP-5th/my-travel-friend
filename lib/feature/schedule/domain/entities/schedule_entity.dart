import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/feature/auth/domain/entities/user_entity.dart';
import 'package:my_travel_friend/feature/schedule/domain/entities/category_entity.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';

part 'schedule_entity.freezed.dart';

//신강현 스케줄 엔티티
@freezed
abstract class ScheduleEntity with _$ScheduleEntity {
  const factory ScheduleEntity({
    int? id,
    String? createdAt,
    required int tripId,
    required String title,
    String? place,
    UserEntity? user,
    String? address,
    double? lat,
    double? lng,
    required String date,
    String? description,
    required int categoryId,
    TripEntity? trip,
    CategoryEntity? category,
  }) = _ScheduleEntity;
}
