/// Represents successful authentication data
class AuthSuccess {
  final String? token;
  final int? userId;

  const AuthSuccess({
    this.token,
    this.userId,
  });

  @override
  String toString() =>
      'AuthSuccess(token: ${token != null ? '[PROTECTED]' : 'null'}, userId: $userId)';

  @override
  bool operator ==(covariant AuthSuccess other) {
    if (identical(this, other)) return true;

    return other.token == token && other.userId == userId;
  }

  @override
  int get hashCode => token.hashCode ^ userId.hashCode;
}
