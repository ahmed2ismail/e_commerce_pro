abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
}

class CacheFailure extends Failure {
  CacheFailure(super.errMessage);
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(super.errMessage);
}

class EmptyServerFailure extends Failure {
  EmptyServerFailure(super.errMessage);
}

class NoInternetFailure extends Failure {
  NoInternetFailure(super.errMessage);
}

class OfflineFailure extends Failure {
  OfflineFailure(super.errMessage);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.errMessage);
}

class ValidationFailure extends Failure {
  ValidationFailure(super.errMessage);
}

class AuthFailure extends Failure {
  AuthFailure(super.errMessage);
}