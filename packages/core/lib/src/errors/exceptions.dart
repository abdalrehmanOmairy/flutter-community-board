class AppExceptions implements Exception {
  const AppExceptions({required this.message});

  final String message;
  @override
  String toString() => '${runtimeType.toString()}: $message';
}

class AuthenticationException extends AppExceptions {
  const AuthenticationException({required super.message});
}

class DatabaseException extends AppExceptions {
  const DatabaseException({required super.message});
}

class PermissionException extends DatabaseException {
  const PermissionException({required super.message});
}

class NotFoundException extends DatabaseException {
  const NotFoundException({required super.message});
}

class StorageServerException extends AppExceptions {
  const StorageServerException({required super.message});
}

class NetworkException extends AppExceptions {
  const NetworkException({
    super.message =
        'Network connection failed.'
        'Please check your internet connection',
  });
}

class UnknownException extends AppExceptions {
  const UnknownException({super.message = 'An unknown error occurred.'});
}
