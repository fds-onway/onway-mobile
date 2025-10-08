/// Represents login credentials
class LoginCredentials {
  final String usuario;
  final String senha;

  const LoginCredentials({
    required this.usuario,
    required this.senha,
  });

  /// Validates if the credentials are not empty
  bool get isValid => usuario.isNotEmpty && senha.isNotEmpty;

  @override
  String toString() =>
      'LoginCredentials(usuario: $usuario, senha: [PROTECTED])';

  @override
  bool operator ==(covariant LoginCredentials other) {
    if (identical(this, other)) return true;

    return other.usuario == usuario && other.senha == senha;
  }

  @override
  int get hashCode => usuario.hashCode ^ senha.hashCode;
}
