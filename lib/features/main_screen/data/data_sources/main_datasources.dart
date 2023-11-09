import 'package:dio/dio.dart';
import 'package:flight_tracker/features/main_screen/data/models/airplane_model.dart';
import 'package:flight_tracker/features/main_screen/data/models/airport_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/http_request.dart';

abstract class MainDataSources {
  Future<List<AirPortModel>> getAirportsList();
  Future<List<AirPlaneModel>> getAirplanesList();
}

@LazySingleton(as: MainDataSources)
class MainDataSourcesImpl implements MainDataSources {
  @override
  Future<List<AirPortModel>> getAirportsList() async {
    try {
      String url = 'airports';
      final response = await HTTPRequest.get(url);
      final data = response.data['data'];
      return data.map<AirPortModel>((airport) {
        return AirPortModel.fromJson(airport);
      }).toList();
    } on DioException catch (e) {
      print("Dio Error [Error: $e] [Response: ${e.response?.data}]]");
      throw RemoteException(
        message: 'Get Airports Fail',
        statusCode: e.response?.statusCode,
        error: e.response?.data,
      );
    }
  }

  @override
  Future<List<AirPlaneModel>> getAirplanesList() async {
    try {
      String url = 'flights';
      final response = await HTTPRequest.get(url);
      final data = response.data['data'];
      return data.map<AirPlaneModel>((flight) {
        return AirPlaneModel.fromJson(flight);
      }).toList();
    } on DioException catch (e) {
      print("Dio Error [Error: $e] [Response: ${e.response?.data}]]");
      throw RemoteException(
        message: 'Get Flights Failed',
        statusCode: e.response?.statusCode,
        error: e.response?.data,
      );
    }
  }
}
