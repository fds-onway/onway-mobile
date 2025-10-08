import 'package:flutter/material.dart';
import 'ui/features/auth/widgets/login_page.dart';

void main() {
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
