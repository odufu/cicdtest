import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:cicdtest/salis/core/utils/helper_functions.dart';
import 'package:cicdtest/salis/core/widgets/app_button.dart';
import 'package:cicdtest/salis/props/presentation/widgets/ownership_slot_page.dart';

import '../widgets/fraction_paid_progress_bar.dart';

class PropDetails extends StatefulWidget {
  PropDetails({super.key});

  @override
  State<PropDetails> createState() => _PropDetailsState();
}

class _PropDetailsState extends State<PropDetails> {
  final images = [
    'assets/images/props6.jpg',
    'assets/images/props6.jpg',
    'assets/images/props7.jpg',
    'assets/images/props9.jpg',
  ];

  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Auto-slide every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      int nextPage = (_pageController.page!.toInt() + 1) % images.length;
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text("Property Details",
            style: TextStyle(color: Theme.of(context).colorScheme.surface)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Slider with Arrow Controls
            Stack(
              children: [
                Container(
                  height: 200,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(images[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 80,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 80,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),

            // Video Player Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Chewie(
                  controller: ChewieController(
                    videoPlayerController: VideoPlayerController.asset(
                      'assets/images/propsvideo.mp4', // Replace with your video asset or network URL
                    ),
                    autoPlay: false,
                    looping: false,
                    allowFullScreen: true,
                    materialProgressColors: ChewieProgressColors(
                      playedColor: Theme.of(context).colorScheme.primary,
                      handleColor: Colors.red,
                      backgroundColor: Colors.grey,
                    ),
                    placeholder: const Center(
                      child: Icon(Icons.play_circle_fill,
                          size: 60, color: Colors.white),
                    ),
                  ),
                ),
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
                  const Divider(),
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
                  const Divider(),
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
                  const Column(
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
                  const SizedBox(
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
                  const Column(
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
                  const SizedBox(
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
                  const Column(
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
                  const SizedBox(
                    height: 20,
                  ),

                  //AVAILABILITY
                  Row(
                    children: [
                      Card(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * .9,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "AVAILABILITY",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
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
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // CO OWNERSHIP PROGRESS BAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .9,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "CO-OWNERSHIP PROGRESS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          Icons.circle,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("90% Complete"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          Icons.circle,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("13-Dec. 2024")
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .5,
                                  child: FractionPaidProgressBar(
                                    fractions: [
                                      FractionPaidData(
                                        isPaid: true,
                                        imageUrl: 'assets/profile.png',
                                        amountPaid: 200000,
                                        equityOwned: 20.0,
                                        datePaid: '13 March, 2023',
                                      ),
                                      FractionPaidData(
                                        isPaid: true,
                                        imageUrl: 'assets/profile.png',
                                        amountPaid: 400000,
                                        equityOwned: 40.0,
                                        datePaid: '15 March, 2023',
                                      ),
                                      FractionPaidData(
                                        isPaid: false,
                                        amountToPay: 500000,
                                        equityToOwn: 50.0,
                                      ),
                                      FractionPaidData(
                                        isPaid: false,
                                        amountToPay: 300000,
                                        equityToOwn: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                                // MAJORE SELLING LINES
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
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
                  const Column(
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
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            AppButton(
                text: "Get 10%",
                onPress: () {
                  HelperFunctions.routePushTo(
                      const OwnershipSlotsPage(), context);
                }),
            AppButton(
              text: "Puechase",
              onPress: () {},
              backgroundColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
