import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:onway/data/models/acess_token_dto.dart';
import 'package:onway/data/models/create_user_dto.dart';
import 'package:onway/data/services/onway_api/api_service.dart';
import 'package:onway/domain/entities/email.dart';
import 'package:result_dart/functions.dart';
import 'package:result_dart/result_dart.dart';
import '../../domain/entities/auth_user.dart';
import '../../util/exceptions/auth_exceptions.dart';
import '../../domain/repositories/auth_repository.dart';
import '../services/auth_service.dart';
import '../mappers/user_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final ApiService _api = ApiService();

  AcessTokenDto? _acessToken;

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

      var response = resp.getOrThrow();

      if (response.statusCode < 200 || response.statusCode >= 300) {
        return failureOf(
          GenericAuthException(
            getAuthErrorMessage(response).toString(),
          ),
        );
      }

      _acessToken = AcessTokenDto.fromJson(jsonDecode(response.body));
      _api.authorize(_acessToken!);

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
      _api.unauthorize();
      return successOf(unit);
    } catch (e) {
      return failureOf(
        GenericAuthException('Sign out failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<AuthUser>> getCurrentGoogleUser() async {
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
    Email password,
  ) async {
    try {
      var apiResult = await _api.post(
        path: 'auth/user',
        body: {
          'email': email,
          'password': password.value,
        },
      );

      var response = apiResult.getOrThrow();

      if (response.statusCode < 200 || response.statusCode >= 300) {
        return failureOf(
          GenericAuthException(
            getAuthErrorMessage(response).toString(),
          ),
        );
      }

      _acessToken = AcessTokenDto.fromJson(jsonDecode(response.body));
      _api.authorize(_acessToken!);

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

  @override
  AsyncResult<Unit> createUserWithEmailAndPassword(
    CreateUserDto dto,
  ) async {
    try {
      var res = await _api.post(
        path: 'user/register',
        body: {
          "name": dto.user,
          "email": dto.email.value,
          "password": dto.password,
        },
      );

      var response = res.getOrThrow();
      if (response.statusCode == 409) {
        return failureOf(
          GenericAuthException('The email address is already in use.'),
        );
      }

      if (response.statusCode == 400) {
        final StringBuffer bufferMessage = StringBuffer();
        var body = jsonDecode(response.body);

        for (var i in body['message']) {
          bufferMessage.writeln('$i');
        }

        return failureOf(
          GenericAuthException(
            bufferMessage.toString(),
          ),
        );
      }

      if (response.statusCode < 200 || response.statusCode >= 300) {
        return failureOf(
          GenericAuthException(
            'Sign up failed with status code: ${response.statusCode}',
          ),
        );
      }

      return successOf(unit);
    } on Exception catch (e) {
      return failureOf(
        GenericAuthException('Email/Password sign up failed: ${e.toString()}'),
      );
    }
  }

  StringBuffer getAuthErrorMessage(Response response) {
    final StringBuffer buffer = StringBuffer();

    if (response.statusCode == 401) {
      var jsonBody = jsonDecode(response.body);
      buffer.writeln(jsonBody['message'] ?? 'Erro desconhecido.');
    } else {
      buffer.writeln('Erro desconhecido.');
    }

    return buffer;
  }

  @override
  AsyncResult<AcessTokenDto> get acessToken async => _acessToken != null
      ? successOf(_acessToken!)
      : failureOf(
          GenericAuthException('No access token available'),
        );
}
