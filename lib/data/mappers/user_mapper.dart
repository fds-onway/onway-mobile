import 'package:firebase_auth/firebase_auth.dart';
import 'package:onway/domain/entities/email.dart';
import '../../domain/entities/auth_user.dart';

/// Extension to convert Firebase User to domain AuthUser
extension FirebaseUserMapper on User {
  AuthUser toDomainEntity() {
    return AuthUser(
      uid: uid,
      email: Email(email ?? ''),
      displayName: displayName,
      photoURL: photoURL,
      provider: providerData.isNotEmpty
          ? providerData.first.providerId
          : 'firebase',
      createdAt: metadata.creationTime,
    );
  }
}
