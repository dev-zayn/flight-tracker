import 'package:dartz/dartz.dart';
import 'package:flight_tracker/features/main_screen/domain/entities/ariplane_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../entities/ariport_entity.dart';
import '../repositories/main_repository.dart';

@lazySingleton
class GetAirportsUseCases {
  final MainRepository _repository;

  GetAirportsUseCases(this._repository);

  Future<Either<Failure, List<AirPortEntity>>> call() async {
    return await _repository.getAirportsList();
  }
}

@lazySingleton
class GetAirplanesUseCases {
  final MainRepository _repository;

  GetAirplanesUseCases(this._repository);

  Future<Either<Failure, List<AirPlaneEntity>>> call() async {
    return await _repository.getAirplanesList();
  }
}
