import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';

// [이재은] OAuth 중간에 취소하는 경우
@LazySingleton()
class CancelOauthUseCase {
  final AuthRepository _repository;

  CancelOauthUseCase(this._repository);

  // OAuth 취소
  void call() {
    _repository.cancelOAuth();
  }

  // OAuth 진행 중인지 확인
  bool get isInProgress => _repository.isOAuthInProgress;
}
