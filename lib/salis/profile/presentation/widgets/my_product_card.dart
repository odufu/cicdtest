import 'package:cicdtest/salis/core/utils/helper_functions.dart';
import 'package:cicdtest/salis/myprops/presentation/widgets/my_props_details.dart';
import 'package:flutter/material.dart';

class MyProductCard extends StatelessWidget {
  final String title;
  final String image;
  final String share;
  final String remaining;
  const MyProductCard({
    required this.image,
    required this.title,
    required this.remaining,
    required this.share,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        HelperFunctions.routePushTo(MyPropsDetails(), context);
      },
      icon: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(image),
                        )),
                  ),
               const   SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 1,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                     const  SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                            const  Icon(
                                Icons.apartment,
                                size: 15,
                                weight: 4,
                              ),
                            const  SizedBox(
                                width: 5,
                              ),
                              Text(
                                title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.donut_large,
                                size: 15,
                                weight: 4,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "My Share:$share%",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.show_chart,
                                size: 15,
                                weight: 4,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Percent Remaining: $remaining%",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
