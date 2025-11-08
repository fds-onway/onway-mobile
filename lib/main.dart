import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onway/ui/core/theme/app_theme.dart';
import 'package:onway/ui/features/home/widgets/home_page.dart';
import 'package:provider/provider.dart';
import 'package:onway/config/firebase/firebase_options.dart';
import 'config/providers/app_providers.dart';
import 'data/services/auth_service.dart';
import 'ui/features/auth/widgets/auth_page.dart';
import 'ui/features/auth/viewmodels/auth_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Google Sign-In
  await GoogleSignInService.initSignIn();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.allProviders,
      child: MaterialApp(
        title: 'OnWay',
        theme: appTheme,
        home: Consumer<AuthViewModel>(
          builder: (context, authViewModel, child) {
            if (authViewModel.isAuthenticated) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
