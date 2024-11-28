import 'package:flutter/material.dart';

import 'revenue/revenure_widget.dart';

class SalesRevenure extends StatelessWidget {
  const SalesRevenure({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.5,
        // shadowColor: Theme.of(context).colorScheme.onSurface.withOpacity(.2),
        // color: Theme.of(context).colorScheme.surface.withOpacity(.1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Sales Revenure',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[900],
                  ),
                ),
              ),
              Column(
                children: [
                  RevenueWidget(
                    title: "Bank Balance",
                    tap: () {
                      print("Impliment Bank Balance Showing");
                    },
                    icon: Icons.money_sharp,
                    account: "10,150.99",
                    color: Colors.red,
                  ),
                  RevenueWidget(
                    title: "Cash In Hand",
                    tap: () {
                      print("Impliment Cash In Hand Showing");
                    },
                    icon: Icons.handshake,
                    account: "10,150.99",
                    color: Colors.green,
                  ),
                  RevenueWidget(
                      title: "Sales on Credit",
                      icon: Icons.sell,
                      account: "10,150.99",
                      color: Theme.of(context).colorScheme.secondary,
                      tap: () {
                        print("Impliment Sales On Credit Showing");
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
