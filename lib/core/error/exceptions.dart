
class ServerException implements Exception {
  final errorMessage;

  const ServerException(this.errorMessage);
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException(this.message);
}

class LocationDisabledException implements Exception {}