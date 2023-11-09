part of 'connectivity_bloc.dart';

class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

class ConnectivityObserve extends ConnectivityEvent {}

class ConnectivityNotify extends ConnectivityEvent {
  final bool isConnected;

  const ConnectivityNotify({this.isConnected = false});
}
