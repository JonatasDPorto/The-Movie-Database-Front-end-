import 'package:the_movie_database_front_end/3_domain/errors/api_errors.dart';

class TMDBException implements Exception {
  final TMDBError type;
  const TMDBException(this.type);
}

class InvalidServiceException extends TMDBException {
  InvalidServiceException() : super(const InvalidServiceError());
}

class DuplicateEntryException extends TMDBException {
  DuplicateEntryException() : super(const DuplicateEntryError());
}

class ServiceOfflineException extends TMDBException {
  ServiceOfflineException() : super(const ServiceOfflineError());
}

class InternalException extends TMDBException {
  InternalException() : super(const InternalError());
}

class ValidationException extends TMDBException {
  ValidationException() : super(const ValidationError());
}

class InvalidAcceptHeaderException extends TMDBException {
  InvalidAcceptHeaderException() : super(const InvalidAcceptHeaderError());
}

class TimeoutException extends TMDBException {
  TimeoutException() : super(const TimeoutError());
}

class RequestCountLimitExceededException extends TMDBException {
  RequestCountLimitExceededException()
      : super(const RequestCountLimitExceededError());
}

class ResourceNotFoundException extends TMDBException {
  ResourceNotFoundException() : super(const ResourceNotFoundError());
}

class PermissionDeniedException extends TMDBException {
  PermissionDeniedException() : super(const PermissionDeniedError());
}

class BackendConnectionException extends TMDBException {
  BackendConnectionException() : super(const BackendConnectionError());
}
