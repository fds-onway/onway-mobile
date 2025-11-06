import 'package:onway/domain/entities/email.dart';

/// Domain entity representing an authenticated user
class AuthUser {
  final String uid;
  final Email email;
  final String? displayName;
  final String? username;
  final String? photoURL;
  final String provider;
  final DateTime? createdAt;

  const AuthUser({
    required this.uid,
    required this.email,
    this.displayName,
    this.username,
    this.photoURL,
    required this.provider,
    this.createdAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthUser && other.uid == uid;
  }

  @override
  int get hashCode => uid.hashCode;

  @override
  String toString() {
    return 'AuthUser(uid: $uid, email: $email, displayName: $displayName, provider: $provider)';
  }
}
