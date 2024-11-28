import 'package:flutter/material.dart';

class MyProps extends StatelessWidget {
  const MyProps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const Column(
        children: [
          Center(
            child: Text("My Properties"),
          )
        ],
      ),
    );
  }
}
