import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entities/ariplane_entity.dart';
import '../entities/ariport_entity.dart';

abstract class MainRepository {
  Future<Either<Failure, List<AirPortEntity>>> getAirportsList();
  Future<Either<Failure, List<AirPlaneEntity>>> getAirplanesList();
}
