import '../../domain/entities/ariport_entity.dart';

class AirPortModel extends AirPortEntity {
  const AirPortModel({
    required super.id,
    required super.airportName,
    required super.country,
    required super.latitude,
    required super.longitude,
  });

  factory AirPortModel.fromJson(Map<String, dynamic> json) {
    return AirPortModel(
      id: json['id'],
      airportName: json['airport_name'] ?? '',
      country: json['country_name'] ?? '',
      longitude:
          json['longitude'] != null ? double.parse(json['longitude']) : 0,
      latitude: json['latitude'] != null ? double.parse(json['latitude']) : 0,
    );
  }
}
