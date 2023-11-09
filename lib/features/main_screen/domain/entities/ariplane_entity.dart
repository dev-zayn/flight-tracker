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

  factory AirPlaneEntity.fromJson(Map<String, dynamic> json) {
    return AirPlaneEntity(
      flightDate: json['flight_date'],
      flightStatus: json['flight_status'],
      departure: FlightStatusInfo(
        airport: json['departure']['airport'],
        scheduledTime: json['departure']['scheduled'] != null
            ? DateTime.parse(json['departure']['scheduled'])
            : null,
        estimatedTime: json['departure']['estimated'] != null
            ? DateTime.parse(json['departure']['estimated'])
            : null,
        actualTime: json['departure']['actual'] != null
            ? DateTime.parse(json['departure']['actual'])
            : null,
      ),
      arrival: FlightStatusInfo(
        airport: json['arrival']['airport'],
        scheduledTime: json['arrival']['scheduled'] != null
            ? DateTime.parse(json['arrival']['scheduled'])
            : null,
        estimatedTime: json['arrival']['estimated'] != null
            ? DateTime.parse(json['arrival']['estimated'])
            : null,
        actualTime: json['arrival']['actual'] != null
            ? DateTime.parse(json['arrival']['actual'])
            : null,
      ),
      airline: json['airline']['name'],
      flightNumber: json['flight']['number'],
    );
  }
//   ToJson method
  Map<String, dynamic> toJson() {
    return {
      'flight_date': flightDate,
      'flight_status': flightStatus,
      'departure': {
        'airport': departure?.airport,
        'scheduled': departure?.scheduledTime?.toIso8601String(),
        'estimated': departure?.estimatedTime?.toIso8601String(),
        'actual': departure?.actualTime?.toIso8601String(),
      },
      'arrival': {
        'airport': arrival?.airport,
        'scheduled': arrival?.scheduledTime?.toIso8601String(),
        'estimated': arrival?.estimatedTime?.toIso8601String(),
        'actual': arrival?.actualTime?.toIso8601String(),
      },
      'airline': {'name': airline},
      'flight': {'number': flightNumber},
    };
  }

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
