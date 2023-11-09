import 'package:flight_tracker/features/main_screen/domain/entities/ariplane_entity.dart';

class AirPlaneModel extends AirPlaneEntity {
  const AirPlaneModel({
    required super.flightDate,
    required super.flightStatus,
    required super.departure,
    required super.arrival,
    required super.airline,
    required super.flightNumber,
  });

  factory AirPlaneModel.fromJson(Map<String, dynamic> json) {
    return AirPlaneModel(
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
}
