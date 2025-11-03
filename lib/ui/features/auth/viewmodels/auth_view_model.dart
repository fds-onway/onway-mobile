import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../state/auth_state.dart';

/// ViewModel for authentication operations following MVVM pattern
class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  StreamSubscription<dynamic>? _authStateSubscription;

  AuthState _state = const AuthState.initial();
  AuthState get state => _state;

  // Convenience getters
  bool get isLoading => _state.isLoading;
  bool get isAuthenticated => _state.isAuthenticated;
  bool get isUnauthenticated => _state.isUnauthenticated;
  bool get hasError => _state.hasError;
  String? get errorMessage => _state.errorMessage;

  AuthViewModel(this._authRepository) {
    _initializeAuthState();
  }

  /// Initialize authentication state and listen to auth changes
  void _initializeAuthState() {
    _authStateSubscription = _authRepository.authStateChanges.listen(
      (user) {
        if (user != null) {
          _updateState(AuthState.authenticated(user));
        } else {
          _updateState(const AuthState.unauthenticated());
        }
      },
      onError: (error) {
        _updateState(AuthState.error('Auth state error: ${error.toString()}'));
      },
    );

    // Check current user on initialization
    _checkCurrentUser();
  }

  /// Check if there's a currently authenticated user
  Future<void> _checkCurrentUser() async {
    final result = await _authRepository.getCurrentUser();

    result.fold(
      (user) => _updateState(AuthState.authenticated(user)),
      (error) => _updateState(const AuthState.unauthenticated()),
    );
  }

  /// Sign in with Google
  Future<void> signInWithGoogle() async {
    if (_state.isLoading) return;

    _updateState(const AuthState.loading());

    final result = await _authRepository.signInWithGoogle();

    result.fold(
      (user) {
        _updateState(AuthState.authenticated(user));
        debugPrint('User signed in: ${user.email}');
      },
      (error) {
        _updateState(AuthState.error(error.toString()));
        debugPrint('Sign in error: ${error.toString()}');
      },
    );
  }

  /// Sign out the current user
  Future<void> signOut() async {
    if (_state.isLoading) return;

    _updateState(const AuthState.loading());

    final result = await _authRepository.signOut();

    result.fold(
      (_) {
        _updateState(const AuthState.unauthenticated());
        debugPrint('User signed out successfully');
      },
      (error) {
        _updateState(AuthState.error(error.toString()));
        debugPrint('Sign out error: ${error.toString()}');
      },
    );
  }

  /// Clear any error state
  void clearError() {
    if (_state.hasError) {
      _updateState(
        _state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: null,
        ),
      );
    }
  }

  /// Update state and notify listeners
  void _updateState(AuthState newState) {
    _state = newState;
    notifyListeners();
  }

  @override
  void dispose() {
    _authStateSubscription?.cancel();
    super.dispose();
  }
}
