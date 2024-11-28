import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<Map<String, dynamic>> cartegories = [
    {
      "name": "Home Stay",
      "icon": Icons.apartment,
    },
    {
      "name": "Office",
      "icon": Icons.house_siding_outlined,
    },
    {
      "name": "Resorts",
      "icon": Icons.local_post_office,
    },
    {
      "name": "Villa",
      "icon": Icons.villa,
    },
    {
      "name": "Apertment",
      "icon": Icons.house,
    },
    {
      "name": "Hostel",
      "icon": Icons.home_repair_service_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/roundedLogo.png",
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
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Section
                      Text(
                        'Category',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartegories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  child: Icon(cartegories[index]["icon"],
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface), // Placeholder Icon
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                cartegories[index]["name"],
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      const Divider(),

                      // Popular Properties Section
                      Text(
                        'Popular Properties',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 150,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(.5),
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/prop${index + 1}.jpg'), // Placeholder
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),

                      // Recently Added Section
                      Text(
                        'Recently Added',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(.5),
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/prop${index + 1}.jpg'), // Placeholder
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
