import 'package:flutter/material.dart';

class FootTrafic extends StatelessWidget {
  const FootTrafic({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width * .4,
        height: 250,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
      ),
      Positioned(
        left: 30,
        child: Container(
          width: MediaQuery.of(context).size.width * .4,
          height: 250,
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "700/Month",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_circle_down,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * .2,
                        child: Text(
                          "(-0.76%) than lastmonth",
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * .3,
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
