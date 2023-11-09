import 'package:equatable/equatable.dart';

class AirPlaneEntity extends Equatable {
  final String? flightDate;
  final String? flightStatus;
  final FlightStatusInfo? departure;
  final FlightStatusInfo? arrival;
  final String? airline;
  final String? flightNumber;

  const AirPlaneEntity({
    required this.flightDate,
    required this.flightStatus,
    required this.departure,
    required this.arrival,
    required this.airline,
    required this.flightNumber,
  });

  @override
  List<Object?> get props => [
        flightDate,
        flightStatus,
        departure,
        arrival,
        airline,
        flightNumber,
      ];
}

class FlightStatusInfo extends Equatable {
  final String? airport;
  final DateTime? scheduledTime;
  final DateTime? estimatedTime;
  final DateTime? actualTime;

  const FlightStatusInfo({
    required this.airport,
    required this.scheduledTime,
    required this.estimatedTime,
    required this.actualTime,
  });

  @override
  List<Object?> get props => [
        airport,
        scheduledTime,
        estimatedTime,
        actualTime,
      ];
}
