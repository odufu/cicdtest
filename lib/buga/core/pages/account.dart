import 'package:flutter/material.dart';

import '../widgets/coming_soon.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ComingSoon(
          title: "ACCOUNT",
        ),
      ),
    );
  }
}
