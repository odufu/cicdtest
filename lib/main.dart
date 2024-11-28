import 'package:cicdtest/buga/core/theme/light_theme.dart';
import 'package:cicdtest/salis/core/theme/salis_mode.dart';
import 'package:flutter/material.dart';

import 'buga/features/authentication/presentation/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lighMode,
      home: const SplashScreen(),
    );
  }
}
