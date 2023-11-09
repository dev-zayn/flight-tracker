import 'package:dartz/dartz.dart';
import 'package:flight_tracker/features/main_screen/data/models/airport_model.dart';
import 'package:flight_tracker/features/main_screen/domain/entities/ariplane_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/clean_code/safe_api_call.dart';
import '../../../../../core/error/failures.dart';
import '../../domain/repositories/main_repository.dart';
import '../data_sources/main_datasources.dart';

@LazySingleton(as: MainRepository)
class MainRepositoryImpl extends MainRepository {
  final MainDataSources dataSources;

  MainRepositoryImpl({required this.dataSources});

  @override
  Future<Either<Failure, List<AirPortModel>>> getAirportsList() async =>
      await safeApiCall(() => dataSources.getAirportsList());

  @override
  Future<Either<Failure, List<AirPlaneEntity>>> getAirplanesList() async =>
      await safeApiCall(() => dataSources.getAirplanesList());
}
