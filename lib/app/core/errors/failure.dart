abstract class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class CacheFailure extends Failure {
  CacheFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class NetworkFailure extends Failure {
  NetworkFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
