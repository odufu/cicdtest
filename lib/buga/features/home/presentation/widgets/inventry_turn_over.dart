import 'package:flutter/material.dart';

class InventryTurnOver extends StatelessWidget {
  const InventryTurnOver({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width * .5,
        height: 250,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(20)),
      ),
      Positioned(
        left: 30,
        child: Container(
          width: MediaQuery.of(context).size.width * .5,
          height: 250,
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "2",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        Text("Good")
                      ],
                    ),
                    SizedBox(
                      width: 1,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_circle_up,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * .2,
                        child: Text(
                          "(+10.76%) than last month",
                          style: TextStyle(color: Colors.green),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Text("Rate At Which Goods AreSold Monthly")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * .3,
                        child: Text(
                          "Learn More",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
