import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({this.message = 'An error occurred'});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({String message = 'Server error occurred'}) : super(message: message);
}

class NetworkFailure extends Failure {
  const NetworkFailure({String message = 'Network error occurred'}) : super(message: message);
}

class CacheFailure extends Failure {
  const CacheFailure({String message = 'Cache error occurred'}) : super(message: message);
}
