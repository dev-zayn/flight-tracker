part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class DetermineCurrentLocationLoading extends MainState {}

class DetermineCurrentLocationIsDisabled extends MainState {
  final String message;

  const DetermineCurrentLocationIsDisabled(this.message);

  @override
  List<Object> get props => [message];
}

class DetermineCurrentLocationAskPermission extends MainState {
  final String message;

  const DetermineCurrentLocationAskPermission(this.message);

  @override
  List<Object> get props => [message];
}

class DetermineCurrentLocationPermissionDenied extends MainState {
  final String message;

  const DetermineCurrentLocationPermissionDenied(this.message);

  @override
  List<Object> get props => [message];
}

class DetermineCurrentLocationPermissionDeniedForever extends MainState {
  final String message;

  const DetermineCurrentLocationPermissionDeniedForever(this.message);

  @override
  List<Object> get props => [message];
}

class DetermineCurrentLocationSuccess extends MainState {}

class DetermineCurrentLocationError extends MainState {
  final String message;

  const DetermineCurrentLocationError(this.message);

  @override
  List<Object> get props => [message];
}

class GetAirportsLoading extends MainState {}

class GetAirportsEmpty extends MainState {}

class GetAirportsSuccess extends MainState {}

class GetAirportsError extends MainState {
  final String message;

  const GetAirportsError(this.message);

  @override
  List<Object> get props => [message];
}

class GetAirplanesLoading extends MainState {}

class GetAirplanesEmpty extends MainState {}

class GetAirplanesSuccess extends MainState {}

class GetAirplanesError extends MainState {
  final String message;

  const GetAirplanesError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchAirplanesLoading extends MainState {}

class SearchAirplanesError extends MainState {}

class SearchAirplanesSuccess extends MainState {}

class BookmarkAirplanesLoading extends MainState {}

class BookmarkAirplanesError extends MainState {}

class BookmarkAirplanesSuccess extends MainState {}
