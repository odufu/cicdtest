import 'package:flutter/material.dart';

import 'coming_soon.dart';

class Sales extends StatelessWidget {
  const Sales({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ComingSoon(
          title: "SALES",
        ),
      ),
    );
  }
}
