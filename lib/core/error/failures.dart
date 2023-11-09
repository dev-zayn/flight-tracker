import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class RemoteFailure extends Failure {
  final RemoteException exception;

  RemoteFailure(this.exception);

  @override
  String toString() => exception.message;

  @override
  List<Object> get props => [exception];
}

// bloc remote failure handling
String remoteMapFailureToMessage(failure) {
  switch (failure.runtimeType) {
    case const (RemoteFailure):
      return failure.exception.message;
    default:
      return 'Something went wrong';
  }
}
