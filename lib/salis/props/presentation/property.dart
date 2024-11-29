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
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30),
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
                    )
                  ],
                ),
              ),
              const ProductCard(
                image: 'assets/images/prop3.jpg',
                name: "4 - Bedroom Bungallow",
                price: "N 4, 000,000",
              ),
              const SizedBox(
                height: 20,
              ),
              const ProductCard(
                image: 'assets/images/prop1.jpg',
                name: "Semi detached duplex",
                price: "N 3000000",
              ),
              const SizedBox(
                height: 20,
              ),
              const ProductCard(
                image: 'assets/images/prop2.jpg',
                name: "4 - Bedroom Bungallow",
                price: "N 3000000",
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
