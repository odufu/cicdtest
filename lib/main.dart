import 'package:cicdtest/salis/auth/presentation/pages/welcome_page.dart';
import 'package:cicdtest/salis/core/theme/salis_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: salisMode,
      home: const WelcomePage(),
    );
  }
}
