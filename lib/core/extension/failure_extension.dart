import '../result/failures.dart';

extension FailureExtension on Failure {
  String get errorType {
    return switch (this) {
      ServerFailure() => 'server',
      NetworkFailure() => 'network',
      AuthFailure() => 'auth',
      UndefinedFailure() => 'unknown',
      Failure() => throw UnimplementedError(),
    };
  }
}
