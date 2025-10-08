import 'package:result_dart/result_dart.dart';

import '../auth/auth_success.dart';
import '../auth/login_credentials.dart';
import '../user.dart';

abstract class AuthRepository {
  Future<Result<AuthSuccess, String>> login(LoginCredentials credentials);

  Future<void> logout();

  Future<User?> getCurrentUser();

  Future<bool> isAuthenticated();

  Future<void> saveAuthToken(String token);

  Future<void> clearAuthData();
}
