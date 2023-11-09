import 'package:equatable/equatable.dart';

class AirPortEntity extends Equatable {
  final String id;
  final String? airportName;
  final String? country;
  final double? latitude;
  final double? longitude;

  const AirPortEntity({
    required this.id,
    required this.airportName,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        id,
        airportName,
        country,
        latitude,
        longitude,
      ];
}
