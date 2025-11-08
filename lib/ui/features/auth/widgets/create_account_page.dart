import 'package:flutter/material.dart';
import 'package:onway/domain/entities/email.dart';
import 'package:onway/ui/core/ui/logo_widget.dart';
import 'package:onway/ui/core/ui/text_field_widget.dart';
import 'package:onway/util/extensions/build_context_extensions.dart';
import 'package:provider/provider.dart';
import 'package:result_dart/result_dart.dart';
import '../viewmodels/auth_view_model.dart';

/// Login page widget following MVVM pattern
class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<AuthViewModel>(
            builder: (context, authViewModel, child) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      'Cadastro de usuário',
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 48),
                    const _AppLogo(),
                    const SizedBox(height: 48),
                    Form(
                      key: _formKey,
                      child: _CredentialsWidget(
                        emailController: _emailController,
                        passwordController: _passwordController,
                        usernameController: _usernameController,
                      ),
                    ),
                    const SizedBox(height: 48),

                    const SizedBox(height: 24),
                    _ConfirmButton(
                      onPressed: authViewModel.isLoading
                          ? null
                          : () => handleCreateAccountTap(authViewModel),
                    ),

                    if (authViewModel.hasError)
                      _ErrorMessage(
                        message: authViewModel.errorMessage!,
                        onDismiss: () => authViewModel.clearError(),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void handleCreateAccountTap(AuthViewModel viewModel) async {
    if (_formKey.currentState!.validate()) {
      var res = await viewModel.createAccount(
        username: _usernameController.text.trim(),
        email: Email(_emailController.text.trim()),
        password: _passwordController.text.trim(),
      );
      if (!mounted) return;
      if (res.isSuccess()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Conta criada com sucesso. Verifique seu e-mail e realize o login em seguida!',
            ),
          ),
        );
        Navigator.pop(context);
      }
    }
  }
}

/// App logo widget
class _AppLogo extends StatelessWidget {
  const _AppLogo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
          ),
          child: LogoWidget(),
        ),
        const SizedBox(height: 16),
        Text(
          'OnWay',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}

class _CredentialsWidget extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;

  const _CredentialsWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
  });

  @override
  State<_CredentialsWidget> createState() => _CredentialsWidgetState();
}

class _CredentialsWidgetState extends State<_CredentialsWidget> {
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          controller: widget.usernameController,
          hintText: 'Usuário',
          labelText: 'Usuário',
          prefixIcon: Icon(Icons.person),
          validator: (input) {
            if (input == null || input.isEmpty) {
              return 'Insura um nome de usuário.';
            }
            var lstr = input.trim().split(' ');

            if (lstr.length < 2) {
              return 'Insira pelo menos um nome e um sobrenome.';
            }

            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFieldWidget(
          hintText: 'Email',
          labelText: 'Email',
          controller: widget.emailController,
          prefixIcon: Icon(Icons.email),
          validator: (input) {
            if (input == null || input.isEmpty) {
              return 'Insira um email válido.';
            }
            if (!Email.isValidEmail(input.trim())) {
              return 'Insira um email válido.';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFieldWidget(
          controller: widget.passwordController,
          hintText: 'Password',
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock),
          obscureText: _obscurePassword,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
            ),
          ),

          validator: (input) {
            if ((input?.length ?? 0) < 8) {
              return 'A senha deve ter pelo menos 8 caracteres.';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const _ConfirmButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FilledButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Confirmar',
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

/// Error message widget
class _ErrorMessage extends StatelessWidget {
  final String message;
  final VoidCallback onDismiss;

  const _ErrorMessage({
    required this.message,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red[200]!),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red[700],
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.red[700],
                fontSize: 14,
              ),
            ),
          ),
          IconButton(
            onPressed: onDismiss,
            icon: Icon(
              Icons.close,
              color: Colors.red[700],
              size: 20,
            ),
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
