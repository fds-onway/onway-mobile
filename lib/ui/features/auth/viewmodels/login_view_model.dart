import 'package:flutter/material.dart';
import '../../../../domain/auth/login_credentials.dart';
import '../../../../domain/repositories/auth_repository.dart';

/// ViewModel for the login page following MVVM pattern
class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  LoginViewModel(this._authRepository);

  // Controllers for form fields
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  // State properties
  bool _isLoading = false;
  String? _errorMessage;
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get rememberMe => _rememberMe;
  bool get isPasswordVisible => _isPasswordVisible;

  /// Checks if the form is valid for submission
  bool get isFormValid {
    return usuarioController.text.isNotEmpty && senhaController.text.isNotEmpty;
  }

  /// Toggles password visibility
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  /// Toggles remember me checkbox
  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    notifyListeners();
  }

  /// Clears any existing error message
  void clearError() {
    if (_errorMessage != null) {
      _errorMessage = null;
      notifyListeners();
    }
  }

  /// Attempts to log in with the provided credentials
  Future<bool> login() async {
    if (!isFormValid) {
      _errorMessage = 'Por favor, preencha todos os campos';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final credentials = LoginCredentials(
        usuario: usuarioController.text.trim(),
        senha: senhaController.text,
      );

      final result = await _authRepository.login(credentials);

      return result.fold(
        (authSuccess) {
          // Success case - clear form on successful login
          usuarioController.clear();
          senhaController.clear();
          _rememberMe = false;

          _isLoading = false;
          notifyListeners();
          return true;
        },
        (errorMessage) {
          // Failure case - show error message
          _errorMessage = errorMessage;
          _isLoading = false;
          notifyListeners();
          return false;
        },
      );
    } catch (e) {
      _errorMessage = 'Erro de conexão. Tente novamente.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  @override
  void dispose() {
    usuarioController.dispose();
    senhaController.dispose();
    super.dispose();
  }
}
