import 'package:the_movie_database_front_end/3_domain/errors/api_execptions.dart';

class ThrowException {
  final int httpErrorCode;

  ThrowException(this.httpErrorCode);

  void call() {
    switch (httpErrorCode) {
      case 501:
        throw InvalidServiceException();
      case 403:
        throw DuplicateEntryException();
      case 503:
        throw ServiceOfflineException();
      case 400:
        throw ValidationException();
      case 406:
        throw InvalidAcceptHeaderException();
      case 504:
        throw TimeoutException();
      case 429:
        throw RequestCountLimitExceededException();
      case 404:
        throw ResourceNotFoundException();
      case 401:
        throw PermissionDeniedException();
      case 502:
        throw BackendConnectionException();
      default:
        throw InternalException();
    }
  }
}
