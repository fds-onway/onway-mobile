/// Base class for all authentication-related exceptions
abstract class AuthException implements Exception {
  final String message;
  final String code;

  const AuthException(this.message, this.code);

  @override
  String toString() => 'AuthException: $message (code: $code)';
}

/// Exception thrown when user credentials are invalid
class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException([String message = 'Invalid credentials'])
    : super(message, 'invalid-credentials');
}

/// Exception thrown when user is not found
class UserNotFoundException extends AuthException {
  const UserNotFoundException([String message = 'User not found'])
    : super(message, 'user-not-found');
}

/// Exception thrown when there's a network error
class NetworkException extends AuthException {
  const NetworkException([String message = 'Network error occurred'])
    : super(message, 'network-error');
}

/// Exception thrown when authentication is cancelled by user
class AuthCancelledException extends AuthException {
  const AuthCancelledException([String message = 'Authentication cancelled'])
    : super(message, 'auth-cancelled');
}

/// Exception thrown for generic authentication errors
class GenericAuthException extends AuthException {
  const GenericAuthException([String message = 'Authentication failed'])
    : super(message, 'auth-failed');
}
