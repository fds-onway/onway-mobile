import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onway/config/firebase/firebase_options.dart';
import 'ui/features/auth/widgets/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnWay',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'System',
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
