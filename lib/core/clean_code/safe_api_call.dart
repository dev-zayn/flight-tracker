import 'package:dartz/dartz.dart';

import '../error/exceptions.dart';
import '../error/failures.dart';

Future<Either<Failure, T>> safeApiCall<T>(
  Future<T> Function() apiCall,
) async {
  try {
    final response = await apiCall();
    return Right(response);
  } on RemoteException catch (exception) {
    print(
        "RemoteException\nMessage: ${exception.message}\nStatusCode: ${exception.statusCode}\nError: ${exception.error}");
    return Left(RemoteFailure(exception));
  } catch (exception) {
    print("ServerException: $exception");
    return Left(ServerFailure());
  }
}
