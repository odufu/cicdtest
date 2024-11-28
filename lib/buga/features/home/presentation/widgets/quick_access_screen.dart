import 'package:flutter/material.dart';

class QuickAccessScreen extends StatelessWidget {
  final List<Map<String, dynamic>> quickAccessItems = [
    {
      'label': 'Inventory',
      'icon': Icons.warehouse,
      'color': Colors.amberAccent
    },
    {'label': 'Invoice', 'icon': Icons.receipt, 'color': Colors.cyanAccent},
    {
      'label': 'Transactions',
      'icon': Icons.swap_horiz,
      'color': Colors.redAccent[100]
    },
    {'label': 'Budget', 'icon': Icons.pie_chart, 'color': Colors.greenAccent},
    {
      'label': 'Virtual Office',
      'icon': Icons.people,
      'color': Colors.pinkAccent
    },
    {
      'label': 'CRM',
      'icon': Icons.people_outline,
      'color': Colors.lightGreenAccent
    },
    {
      'label': 'Suppliers',
      'icon': Icons.local_shipping,
      'color': Colors.grey[300]
    },
    {'label': 'FHD', 'icon': Icons.assessment, 'color': Colors.yellowAccent},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            height: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface, width: 1.5),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Grid Layout for Icons and Labels
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: .6,
                  ),
                  itemCount: quickAccessItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(quickAccessItems[index]["label"]);
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: quickAccessItems[index]['color'],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              quickAccessItems[index]['icon'],
                              color: Colors.blueGrey[900],
                              size: 30,
                            ),
                          ),
                          Text(
                            quickAccessItems[index]['label'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            left: 20,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface),
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'Quick Access',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
