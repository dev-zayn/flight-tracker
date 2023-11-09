import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flight_tracker/features/main_screen/domain/entities/ariplane_entity.dart';
import 'package:flight_tracker/features/main_screen/domain/entities/ariport_entity.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/use_cases/main_usecase.dart';

part 'main_event.dart';
part 'main_state.dart';

@singleton
class MainBloc extends Bloc<MainEvent, MainState> {
  final GetAirportsUseCases getAirportsUseCases;
  final GetAirplanesUseCases getAirplanesUseCases;

  List<AirPlaneEntity> _airplanes = [];
  List<AirPlaneEntity> get airplanes => _airplanes;

  List<AirPlaneEntity> _bookmarked = [];
  List<AirPlaneEntity> get bookmarked => _bookmarked;

  List<AirPlaneEntity> _searchResualt = [];
  List<AirPlaneEntity> get searchResualt => _searchResualt;
  List<AirPortEntity> _airports = [];
  List<AirPortEntity> get airports => _airports;

  TextEditingController searchController = TextEditingController();

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  double latitude = 0;

  double longitude = 0;

  Position? position;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(33.31524, 44.3660667),
    zoom: 6,
  );

  GoogleMapController? gmc;
  MainBloc(this.getAirportsUseCases, this.getAirplanesUseCases)
      : super(MainInitial()) {
    on<MainEvent>((event, emit) {});
    on<DetermineCurrentLocationEvent>((event, emit) async {
      emit(DetermineCurrentLocationLoading());
      try {
        final data = await determinePosition();
        print(' currentPosition $data');
        if (data is String) {
          if (data == 'Location services are disabled') {
            emit(DetermineCurrentLocationIsDisabled(data));
          } else if (data == 'Location permissions are denied') {
            emit(DetermineCurrentLocationPermissionDenied(data));
          } else if (data ==
              'Location permissions are permanently denied, we cannot request permissions.') {
            emit(DetermineCurrentLocationPermissionDeniedForever(data));
          } else {
            emit(DetermineCurrentLocationError(data));
          }
        } else {
          latitude = data.latitude;
          longitude = data.longitude;
          position = data;
          emit(DetermineCurrentLocationSuccess());
          if (airports.isEmpty) {
            add(const GetAirportsEvent());
          }
        }
      } catch (e) {
        emit(const DetermineCurrentLocationError('Something went wrong'));
      }
    });
    on<GetAirportsEvent>((event, emit) async {
      emit(GetAirportsLoading());
      try {
        final data = await gettingAirports();
        emit(data);
      } catch (e) {
        emit(const GetAirportsError('Something went wrong'));
      }
    });
    on<GetAirplanesEvent>((event, emit) async {
      emit(GetAirplanesLoading());
      try {
        final data = await gettingAirplanes();
        emit(data);
      } catch (e) {
        emit(const GetAirportsError('Something went wrong'));
      }
    });
    on<SearchAirplanesEvent>((event, emit) async {
      emit(SearchAirplanesLoading());
      try {
        for (var airplane in _airplanes) {
          // if (airplane.flightStatus
          //             ?.toLowerCase()
          //             .contains(searchController.text.toLowerCase()) ==
          //         true ||
          //     airplane.flightNumber
          //             ?.toLowerCase()
          //             .contains(searchController.text.toLowerCase()) ==
          //         true ||
          //     airplane.departure?.airport
          //             ?.toLowerCase()
          //             .contains(searchController.text.toLowerCase()) ==
          //         true ||
          //     airplane.arrival?.airport
          //             ?.toLowerCase()
          //             .contains(searchController.text.toLowerCase()) ==
          //         true) {
          //   _searchResualt.add(airplane);
          // } else {
          //   _searchResualt.clear();
          // }
          if (airplane.flightStatus
                  ?.toLowerCase()
                  .contains(searchController.text.toLowerCase()) ==
              true) {
            _searchResualt.add(airplane);
          } else {
            _searchResualt.clear();
          }
          emit(SearchAirplanesSuccess());
        }
      } catch (e) {
        print('e is $e');
        emit(const GetAirportsError('Something went wrong'));
      }
    });
    on<BookmarkAirplanesEvent>((event, emit) async {
      emit(BookmarkAirplanesLoading());
      try {
        if (bookmarked.contains(event.airplane) == false) {
          bookmarked.add(event.airplane);
        } else {
          bookmarked.remove(event.airplane);
        }
        emit(BookmarkAirplanesSuccess());
      } catch (e) {
        emit(const GetAirportsError('Something went wrong'));
      }
    });
  }
  Future<dynamic> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.value('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.value('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.value(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future gettingAirports() async {
    final failureOrGetAirports = await getAirportsUseCases();
    final data = failureOrGetAirports.fold(
      (failure) => GetAirportsError(remoteMapFailureToMessage(failure)),
      (response) {
        _airports = response;
        _markers = response
            .map((e) => Marker(
                  markerId: MarkerId(e.id.toString()),
                  icon: markerIcon,
                  position: LatLng(e.latitude ?? 0, e.longitude ?? 0),
                  infoWindow: InfoWindow(
                    title: e.airportName,
                    snippet: e.country,
                  ),
                ))
            .toSet();
        return GetAirportsSuccess();
      },
    );
    return data;
  }

  Future gettingAirplanes() async {
    final failureOrGetAirplanes = await getAirplanesUseCases();
    final data = failureOrGetAirplanes.fold(
      (failure) => GetAirplanesError(remoteMapFailureToMessage(failure)),
      (response) {
        _airplanes = response;
        return GetAirplanesSuccess();
      },
    );
    return data;
  }
}
