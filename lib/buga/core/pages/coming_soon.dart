import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo2.png",
                width: 100,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "$title Coming Soon",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
