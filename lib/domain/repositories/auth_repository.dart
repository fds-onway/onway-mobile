import 'package:onway/data/models/acess_token_dto.dart';
import 'package:onway/data/models/create_user_dto.dart';
import 'package:onway/domain/entities/email.dart';
import 'package:result_dart/result_dart.dart';
import '../entities/auth_user.dart';

/// Repository interface for authentication operations
abstract class AuthRepository {
  /// Sign in with Google
  Future<Result<AuthUser>> signInWithGoogle();

  Future<Result<AuthUser>> signInWithEmailAndPassword(
    String email,
    Email password,
  );

  AsyncResult<Unit> createUserWithEmailAndPassword(
    CreateUserDto dto,
  );

  /// Sign out the current user
  Future<Result<Unit>> signOut();

  /// Get the currently authenticated user
  Future<Result<AuthUser>> getCurrentGoogleUser();

  AsyncResult<AcessTokenDto> get acessToken;

  /// Stream of authentication state changes
  Stream<AuthUser?> get authStateChanges;
}
