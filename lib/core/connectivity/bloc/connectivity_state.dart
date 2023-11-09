part of 'connectivity_bloc.dart';

class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object> get props => [];
}

class ConnectivityInitial extends ConnectivityState {}

class ConnectivitySuccess extends ConnectivityState {}

class ConnectivityFailure extends ConnectivityState {}
