import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  // 서버 통신 오류
  const factory Failure.serverFailure({required String message}) =
      ServerFailure;
  // 네트워크 연결 오류
  const factory Failure.networkFailure({required String message}) =
      NetworkFailure;
  // 인증 관련 오류
  const factory Failure.authFailure({required String message}) = AuthFailure;
  //다른 오류
  const factory Failure.undefined({required String message}) = UndefinedFailure;
}
