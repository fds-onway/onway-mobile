import 'package:result_dart/result_dart.dart';
import '../entities/auth_user.dart';

/// Repository interface for authentication operations
abstract class AuthRepository {
  /// Sign in with Google
  Future<Result<AuthUser>> signInWithGoogle();

  Future<Result<AuthUser>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  /// Sign out the current user
  Future<Result<Unit>> signOut();

  /// Get the currently authenticated user
  Future<Result<AuthUser>> getCurrentUser();

  /// Stream of authentication state changes
  Stream<AuthUser?> get authStateChanges;
}
