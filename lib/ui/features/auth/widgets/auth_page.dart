import 'package:flutter/material.dart';
import 'package:onway/ui/core/ui/logo_widget.dart';
import 'package:onway/ui/core/ui/text_field_widget.dart';
import 'package:onway/ui/features/auth/widgets/create_account_page.dart';
import 'package:onway/util/extensions/build_context_extensions.dart';
import 'package:onway/util/navigation/util_navigation.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_view_model.dart';

/// Login page widget following MVVM pattern
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<AuthViewModel>(
            builder: (context, authViewModel, child) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 48),
                    const _AppLogo(),

                    const SizedBox(height: 48),

                    const SizedBox(height: 48),
                    _LoginAndPassword(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      obscureText: obscurePassword,
                      onToggleObscure: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                    const SizedBox(height: 48),

                    // Google Sign In Button
                    _GoogleSignInButton(
                      onPressed: authViewModel.isLoading
                          ? null
                          : () => authViewModel.signInWithGoogle(),
                      isLoading: authViewModel.isLoading,
                    ),

                    const SizedBox(height: 24),
                    _ConfirmButton(
                      onPressed: authViewModel.isLoading
                          ? null
                          : () {
                              final email = _emailController.text;
                              final password = _passwordController.text;
                              authViewModel.signInWithEmailAndPassword(
                                email,
                                password,
                              );
                            },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _CreateAccountButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              UtilNavigation.nextPageFromLeft(
                                page: const CreateAccountPage(),
                              ),
                            );
                          },
                        ),
                      ],
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
}

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

class _LoginAndPassword extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscureText;
  final Function()? onToggleObscure;

  const _LoginAndPassword({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.obscureText,
    this.onToggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          hintText: 'Email',
          labelText: 'Email',
          controller: emailController,
          prefixIcon: Icon(Icons.email),
        ),
        const SizedBox(height: 16),
        TextFieldWidget(
          controller: passwordController,
          hintText: 'Password',
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock),
          obscureText: obscureText,
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: onToggleObscure,
          ),
        ),
      ],
    );
  }
}

/// Google Sign In button widget
class _GoogleSignInButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;

  const _GoogleSignInButton({
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 2,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_google.png',
                    height: 24,
                    width: 24,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.g_mobiledata,
                        size: 24,
                        color: Colors.red,
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Continuar com o Google',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
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
            'Acessar',
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

class _CreateAccountButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const _CreateAccountButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Não tem uma conta?',
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.outlineVariant,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Cadastre-se',
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ],
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red[700],
            size: 20,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.red[700],
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: onDismiss,
            icon: Icon(
              Icons.close,
              color: Colors.red[700],
              size: 20,
            ),
            //constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
