part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class GetAirportsEvent extends MainEvent {
  const GetAirportsEvent();
}

class GetAirplanesEvent extends MainEvent {
  const GetAirplanesEvent();
}

class SearchAirplanesEvent extends MainEvent {
  const SearchAirplanesEvent();
}

class BookmarkAirplanesEvent extends MainEvent {
  final AirPlaneEntity airplane;
  const BookmarkAirplanesEvent(this.airplane);

  @override
  List<Object> get props => [airplane];
}

class DetermineCurrentLocationEvent extends MainEvent {
  const DetermineCurrentLocationEvent();
}
