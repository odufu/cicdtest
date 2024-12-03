import 'package:cicdtest/salis/profile/presentation/widgets/dp_card.dart';
import 'package:flutter/material.dart';

import 'widgets/my_product_card.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DpCard(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyProductCard(
                  image: "assets/images/props7.jpg",
                  title: "Lugbe Luxo Home",
                  share: "25",
                  remaining: "75",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyProductCard(
                  image: "assets/images/props11.jpg",
                  title: "Salis Court Homes",
                  share: "25",
                  remaining: "75",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
