import 'package:flutter/material.dart';

class Property extends StatelessWidget {
  const Property({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/prop3.jpg"))),
                ),
                const Text(
                  "4-Bedroom Bungallow, in Estate",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                    "Chic one-bedroom apartment featuring contemporary design, ample natural light, and prime city accessibility"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.grey.shade100,
                      padding: const EdgeInsets.all(10),
                      child: Text("N 300000"),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        "20%",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Stack(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.surface,
                              size: 15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.surface,
                              size: 15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.surface,
                              size: 15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.surface,
                              size: 15,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.surface,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 10,
                        thickness: 10,
                      )
                    ])
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
