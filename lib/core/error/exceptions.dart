class RemoteException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic error;

  RemoteException({required this.message, this.statusCode, this.error});

  @override
  String toString() => message;
}

class ServerException implements Exception {}
