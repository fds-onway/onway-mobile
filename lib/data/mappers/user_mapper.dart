import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/auth/auth_user.dart';

/// Extension to convert Firebase User to domain AuthUser
extension FirebaseUserMapper on User {
  AuthUser toDomainEntity() {
    return AuthUser(
      uid: uid,
      email: email ?? '',
      displayName: displayName,
      photoURL: photoURL,
      provider: providerData.isNotEmpty
          ? providerData.first.providerId
          : 'firebase',
      createdAt: metadata.creationTime,
    );
  }
}
