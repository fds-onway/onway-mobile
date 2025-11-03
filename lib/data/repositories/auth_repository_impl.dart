import 'package:firebase_auth/firebase_auth.dart';
import 'package:onway/data/services/api_service.dart';
import 'package:onway/domain/entities/email.dart';
import 'package:result_dart/functions.dart';
import 'package:result_dart/result_dart.dart';
import '../../domain/entities/auth_user.dart';
import '../../util/exceptions/auth_exceptions.dart';
import '../../domain/repositories/auth_repository.dart';
import '../services/auth_service.dart';
import '../mappers/user_mapper.dart';

/// Implementation of AuthRepository using Firebase and Google Sign-In
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final ApiService _api = ApiService();

  AuthRepositoryImpl({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<Result<AuthUser>> signInWithGoogle() async {
    try {
      final userCredential = await GoogleSignInService.signInWithGoogle();

      if (userCredential?.user == null) {
        return failureOf(
          const AuthCancelledException('Google sign in was cancelled'),
        );
      }

      var idToken = await userCredential?.user?.getIdToken();
      var resp = await _api.post(
        path: 'auth/google/token',
        body: {'idToken': idToken ?? ''},
      );

      final authUser = userCredential!.user!.toDomainEntity();
      return successOf(authUser);
    } on FirebaseAuthException catch (e) {
      return failureOf(_mapFirebaseException(e));
    } catch (e) {
      return failureOf(
        GenericAuthException('Google sign in failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      await GoogleSignInService.signOut();
      return successOf(unit);
    } catch (e) {
      return failureOf(
        GenericAuthException('Sign out failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<AuthUser>> getCurrentUser() async {
    try {
      final user = GoogleSignInService.getCurrentUser();

      if (user == null) {
        return failureOf(
          const UserNotFoundException('No user is currently signed in'),
        );
      }

      return successOf(user.toDomainEntity());
    } catch (e) {
      return failureOf(
        GenericAuthException('Failed to get current user: ${e.toString()}'),
      );
    }
  }

  @override
  Stream<AuthUser?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((user) {
      return user?.toDomainEntity();
    });
  }

  /// Maps Firebase Auth exceptions to domain exceptions
  AuthException _mapFirebaseException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return const UserNotFoundException();
      case 'wrong-password':
      case 'invalid-credential':
        return const InvalidCredentialsException();
      case 'network-request-failed':
        return const NetworkException();
      case 'user-disabled':
        return const GenericAuthException('User account has been disabled');
      default:
        return GenericAuthException(e.message ?? 'Authentication failed');
    }
  }

  @override
  Future<Result<AuthUser>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      //simules a api call, TODO implement real api call
      await Future.delayed(const Duration(seconds: 4));
      return AuthUser(
        uid: 'uid',
        email: Email(email),
        provider: 'onway',
      ).toSuccess();
    } catch (e) {
      return failureOf(
        GenericAuthException('Email/Password sign in failed: ${e.toString()}'),
      );
    }
  }
}
