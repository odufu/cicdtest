import 'package:cicdtest/salis/core/utils/helper_functions.dart';
import 'package:cicdtest/salis/props/presentation/pages/prop_details.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/app_button.dart';

class ProductCard extends StatelessWidget {
  final List<String> images; // Updated to accept multiple images
  final String name;
  final String price;
  const ProductCard({
    required this.images,
    required this.name,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage(images[index]), // NetworkImage for URLs
                      ),
                    ),
                  );
                },
              ),
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 3, color: Theme.of(context).colorScheme.error),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Text(
                      "50%",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: 23,
                          left: 10,
                          child: Container(
                            height: 1,
                            color: Theme.of(context).colorScheme.primary,
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
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  text: "VIEW Details",
                  width: 130,
                  onPress: () {
                    HelperFunctions.routePushTo(PropDetails(), context);
                  },
                  backgroundColor: const Color.fromARGB(255, 29, 97, 31),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.favorite,
                          color: Theme.of(context).colorScheme.surface,
                          size: 15,
                        )))
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
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
        height: 20,
        width: 20,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: isPaid
                ? const Color.fromARGB(255, 51, 128, 54)
                : Theme.of(context).colorScheme.surface,
            border: isPaid
                ? Border.all(width: 3, color: Colors.green)
                : Border.all(
                    width: 1, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
