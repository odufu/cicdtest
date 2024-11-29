import 'package:flutter/material.dart';
import '../../props/presentation/widgets/my_props_card.dart';

class MyProps extends StatefulWidget {
  const MyProps({super.key});

  @override
  State<MyProps> createState() => _MyPropsState();
}

class _MyPropsState extends State<MyProps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 450, // Maximum width for each card
            mainAxisExtent: 470,
            mainAxisSpacing: 16.0, // Vertical spacing between cards
            crossAxisSpacing: 16.0, // Horizontal spacing between cards
            childAspectRatio: .9, // Adjust card aspect ratio (width/height)
          ),
          itemCount: 5, // Replace with your actual number of items
          itemBuilder: (context, index) {
            return MyPropsCard(
              imageUrls: [
                "assets/images/props13.jpg",
                "assets/images/props14.jpg",
                "assets/images/props15.jpg",
                "assets/images/props16.jpg",
                "assets/images/props17.jpg",
              ],
              title: 'Semi Detached Duplex',
              ownership: '20%',
              completionStatus: '90%',
              status: 'In Progress',
              nextPaymentDue: '12th Dec. 2024',
              location: 'Gwarimpa Abuja',
              rating: 4,
            );
          },
        ),
      ),
    );
  }
}
