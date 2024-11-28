import 'package:flutter/material.dart';

import 'account.dart';
import 'expenses.dart';
import 'insights.dart';
import 'sales.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int _selectedIndex = 0; // Initial selected index
  final List<Widget> _availablePages = const [
    Insights(),
    Sales(),
    Expenses(),
    Account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _availablePages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        currentIndex: _selectedIndex, // Set the selected index
        onTap: _onItemTapped, // Handle item tap
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.insights,
                  color: Theme.of(context).colorScheme.tertiary),
              activeIcon: Icon(Icons.insights_outlined,
                  color: Theme.of(context).colorScheme.secondary),
              label: "Insights",
              backgroundColor: Theme.of(context).colorScheme.onSurface),
          BottomNavigationBarItem(
            icon: Icon(Icons.mark_chat_read,
                color: Theme.of(context).colorScheme.tertiary),
            activeIcon: Icon(Icons.mark_chat_read,
                color: Theme.of(context).colorScheme.secondary),
            label: "Sales",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money,
                color: Theme.of(context).colorScheme.tertiary),
            activeIcon: Icon(Icons.money,
                color: Theme.of(context).colorScheme.secondary),
            label: "Expenses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance,
                color: Theme.of(context).colorScheme.tertiary),
            activeIcon: Icon(Icons.account_balance,
                color: Theme.of(context).colorScheme.secondary),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
