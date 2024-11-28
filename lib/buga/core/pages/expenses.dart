import 'package:flutter/material.dart';
import '../widgets/coming_soon.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ComingSoon(
          title: "EXPENSES",
        ),
      ),
    );
  }
}
