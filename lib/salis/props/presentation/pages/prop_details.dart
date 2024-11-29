import 'package:cicdtest/salis/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class PropDetails extends StatelessWidget {
  PropDetails({super.key});

  final images = [
    'assets/images/props6.jpg',
    'assets/images/props5.jpg',
    'assets/images/props7.jpg',
    'assets/images/props9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Property Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //MAIN IMAGE SLIDERS
            Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 3))),
              height: 200,
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
            //VIDEO IF ANY
            Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 5))),
              height: 100,
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

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TITLE
                  Text(
                    "Mordern Luxery Appertment",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //PROPS TYPE
                  Text(
                    "Appartment",
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // LOCATION
                  Text(
                    "Gwarimpa Kubwa, FCT Abuja",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  // DESCRIOTION
                  Divider(),
                  Text(
                    "Immerse yourself in luxury with this modern apartment featuring spacious rooms, top-notch amenities, and breathtaking views. Ideal for those seeking a blend of comfort and sophistication",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  // CONTENTS
                  Text(
                    "Features",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  const Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [Icon(Icons.bolt), Text("Electricity")],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              Icon(Icons.apartment),
                              Text("Bedrooms: 2")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [Icon(Icons.security), Text("Security")],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              Icon(Icons.bathroom),
                              Text("Bathroom: 4")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [Icon(Icons.water), Text("Water")],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              Icon(Icons.width_full),
                              Text("Size: 1200 sq Foot")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  // EMENITIES
                  Text(
                    "Amenities",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Packing Space: 2")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Garden: Comon")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Pool: Shared")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // CO-OWN PULL DETAILS
                  Text(
                    "Co-Ownershoip",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Co-Ownership Details: 15%")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Total Ownership Pregress: 90%")
                        ],
                      ),
                    ],
                  ),
                  //PRICE AND PAYMENTS
                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Price and Payment Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Total Property Cost: N 500, 0000")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Payment Schedule: 6 x N 10 Mil")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //AVAILABILITY
                  Text(
                    "AVAILABILITY",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Status: In Progress")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Next Payment Due: N 500,000")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // CO OWNERSHIP PROGRESS BAR
                  Text(
                    "CO-OWNERSHIP PROGRESS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("90% Complete")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("13-Dec. 2024")
                        ],
                      ),
                    ],
                  ),
                  // MAJORE SELLING LINES
                  SizedBox(
                    height: 20,
                  ),

                  //AVAILABILITY
                  Text(
                    "WHY SHOULD YOU BUY THIS?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check,
                            size: 15,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Good title Document (Registered Survey)")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.red,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Free from Government")
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.red,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Fast appreciable value")
                        ],
                      ),
                    ],
                  ),
                  // SITE MAP
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "SITE MAP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset("assets/images/map.jpg"),
                  // FLOOR PLANS
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "HOUSE PLAN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset("assets/images/plan.jpg"),
                  //RELATED PROPS SLIDES
                  //BUTTONS

                  Row(
                    children: [
                      AppButton(text: "Get 10%", onPress: () {}),
                      AppButton(
                        text: "Puechase",
                        onPress: () {},
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
