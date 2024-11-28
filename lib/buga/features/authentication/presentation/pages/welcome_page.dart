import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/widgets/auth_elevated_button.dart';
import 'signup_page.dart';

class WelcomeScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const WelcomeScreen());

  const WelcomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;
  int currentPage = 0;

  final List<String> images = [
    "assets/images/bugawelcome2a.png",
    "assets/images/bugawelcome3a.png",
    "assets/images/bugawelcome4a.png",
  ];

  final List<String> images2 = [
    "assets/images/bugawelcome2b.png",
    "assets/images/bugawelcome3b.png",
    "assets/images/bugawelcome4b.png",
  ];
  final List<String> messages = [
    "Access Tools To Manage and Grow Your Business.",
    "Fast and Secure Payment Solutions for Your Business",
    "Automatically Organize Your Personal and Business Expenses",
  ];

  @override
  void initState() {
    super.initState();
    // Automatically change page every second
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        currentPage = (currentPage + 1) % 3;
      });
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image slider
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 200, child: Image.asset(images[index])),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                            height: 250, child: Image.asset(images2[index])),
                      ),
                    ],
                  );
                },
              ),
            ),

            // // Dot Indicator
            // SmoothPageIndicator(
            //   controller: _pageController,
            //   count: images.length,
            //   effect: WormEffect(
            //     dotHeight: 15.0,
            //     dotWidth: 15.0,
            //     activeDotColor:
            //         Colors.grey.shade700, // Set the active dot color
            //     dotColor: Colors.grey.shade500,
            //   ),
            // ),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                messages[currentPage],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            // Buttons
            AuthElevatedButton(
              buttonText: "Authenticate",
              onPressed: () {
                //implimenting navigation to the signup page
                Navigator.pushReplacement(context, SignUpPage.route());
              },
              color: Colors.black,
              backgroundColor: const Color.fromARGB(255, 33, 240, 243),
            ),
            // const SizedBox(height: 10),
            // AuthElevatedButton(
            //   buttonText: "Login",
            //   color: Theme.of(context).colorScheme.surface,
            //   backgroundColor: Colors.transparent,
            //   onPressed: () {
            //     Navigator.push(context, LoginPage.route());
            //   },
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage("assets/images/footerdecor.png"))),
            )
          ],
        ),
      ),
    );
  }
}
