import 'package:cicdtest/salis/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

import 'widgets/product_card.dart';

class Property extends StatelessWidget {
  const Property({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Added const for static values
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/roundedLogo.png",
                      color: Theme.of(context).colorScheme.primary,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 45,
                        child: SearchBar(
                          leading: Icon(Icons.search),
                          hintText: "Search Here...",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Removed const for dynamic images
              ProductCard(
                images: [
                  'assets/images/props9.jpg',
                  'assets/images/props10.jpg',
                  'assets/images/props11.jpg',
                  'assets/images/props4.jpg'
                ],
                name: "3-Bed Duplex",
                price: "₦ 500,000",
              ),
              const SizedBox(
                height: 20,
              ),
              ProductCard(
                images: [
                  'assets/images/props11.jpg',
                  'assets/images/props12.jpg',
                  'assets/images/props3.jpg',
                  'assets/images/props4.jpg'
                ],
                name: "4 - Bedroom Bungallow",
                price: "₦ 400,000",
              ),
              const SizedBox(
                height: 20,
              ),
              ProductCard(
                images: [
                  'assets/images/props3.jpg',
                  'assets/images/props2.jpg',
                  'assets/images/props1.jpg',
                  'assets/images/props4.jpg'
                ],
                name: "4 - Bedroom Bungallow",
                price: "₦ 400,000",
              ),
              const SizedBox(
                height: 20,
              ),
              ProductCard(
                images: [
                  'assets/images/props4.jpg',
                  'assets/images/props1.jpg',
                  'assets/images/props3.jpg',
                  'assets/images/props2.jpg'
                ],
                name: "4 - Bedroom Bungallow",
                price: "₦ 400,000",
              ),
              const SizedBox(
                height: 20,
              ),
              ProductCard(
                images: [
                  'assets/images/props6.jpg',
                  'assets/images/props6.jpg',
                  'assets/images/props8.jpg',
                  'assets/images/props9.jpg'
                ],
                name: "4 - Bedroom Bungallow",
                price: "₦ 400,000",
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
