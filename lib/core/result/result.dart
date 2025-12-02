import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_travel_friend/core/result/failures.dart';

part 'result.freezed.dart';

// T: 성공 시 반환할 데이터 타입
@freezed
abstract class Result<T> with _$Result<T> {
  // 성공 상태: T 타입의 데이터를 포함
  const factory Result.success(T data) = Success<T>;

  // 실패 상태: Failure 타입의 에러 객체를 포함
  const factory Result.failure(Failure failure) = FailureResult<T>;
}
