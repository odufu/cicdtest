import 'package:flutter/material.dart';

import 'welcome_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 100,
                  child: Image.asset("assets/images/roundedLogo.png")),
              const SizedBox(
                height: 60,
              ),
              Text(
                "SALIS",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w100,
                    letterSpacing: 10,
                    color: Theme.of(context).colorScheme.surface),
              ),
              Text(
                "HOMES",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.surface),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Wait a second..."),
              const SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomePage()));
                },
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.surface,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
