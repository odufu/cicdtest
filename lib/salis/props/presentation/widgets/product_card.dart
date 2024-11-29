import 'package:flutter/material.dart';

import '../../../core/widgets/app_button.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const ProductCard({
    required this.image,
    required this.name,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(image))),
          ),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
              "Chic one-bedroom apartment featuring contemporary design, ample natural light, and prime city accessibility"),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface),
                    borderRadius: BorderRadius.circular(50)),
                padding: const EdgeInsets.all(10),
                child: Text(
                  price,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Theme.of(context).colorScheme.error),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                  child: Text(
                    "50%",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Stack(children: [
                  Positioned(
                      bottom: 23,
                      left: 10,
                      child: Expanded(
                        child: Container(
                          height: 1,
                          width: 200,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FractionPaid(
                        isPaid: true,
                      ),
                      FractionPaid(
                        isPaid: true,
                      ),
                      FractionPaid(
                        isPaid: false,
                      ),
                      FractionPaid(
                        isPaid: false,
                      ),
                    ],
                  ),
                ]),
              )
            ],
          ),
          Row(
            children: [
              AppButton(text: "Inidcate Interest", onPress: () {}),
              AppButton(text: "Add to favorite", onPress: () {}),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class FractionPaid extends StatelessWidget {
  final bool isPaid;
  const FractionPaid({
    required this.isPaid,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Container(
        height: 30,
        width: 30,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: isPaid
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surface,
            border: Border.all(
                width: 3, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Icon(
            Icons.check,
            color: Theme.of(context).colorScheme.surface,
            size: 15,
          ),
        ),
      ),
    );
  }
}
