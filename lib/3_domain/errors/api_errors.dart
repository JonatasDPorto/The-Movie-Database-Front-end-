class TMDBError {
  final String message;
  const TMDBError({required this.message});
}

class InvalidServiceError extends TMDBError {
  const InvalidServiceError()
      : super(message: 'Invalid service: this service does not exist.');
}

class DuplicateEntryError extends TMDBError {
  const DuplicateEntryError()
      : super(
            message:
                'Duplicate entry: The data you tried to submit already exists.');
}

class ServiceOfflineError extends TMDBError {
  const ServiceOfflineError()
      : super(
            message:
                'Service offline: This service is temporarily offline, try again later.');
}

class InternalError extends TMDBError {
  const InternalError()
      : super(message: 'Internal error: Something went wrong, contact TMDB.');
}

class ValidationError extends TMDBError {
  const ValidationError() : super(message: 'Validation failed.');
}

class InvalidAcceptHeaderError extends TMDBError {
  const InvalidAcceptHeaderError() : super(message: 'Invalid accept header.');
}

class TimeoutError extends TMDBError {
  const TimeoutError()
      : super(
            message:
                'Your request to the backend server timed out. Try again.');
}

class RequestCountLimitExceededError extends TMDBError {
  const RequestCountLimitExceededError()
      : super(message: 'Your request count is over the allowed limit.');
}

class ResourceNotFoundError extends TMDBError {
  const ResourceNotFoundError()
      : super(message: 'The resource you requested could not be found.');
}

class PermissionDeniedError extends TMDBError {
  const PermissionDeniedError()
      : super(message: 'You don\'t have permission to edit this resource.');
}

class BackendConnectionError extends TMDBError {
  const BackendConnectionError()
      : super(message: 'Couldn\'t connect to the backend server.');
}
