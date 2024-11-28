import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Revenue Overview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("General Overview"),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "General Overview"),
              Tab(text: "Business"),
              Tab(text: "Accounting"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SalesRevenueCard(),
        ),
      ),
    );
  }
}

class SalesRevenueCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sales Revenue",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          SizedBox(height: 16.0),
          SalesItem(
            icon: Icons.account_balance,
            label: "Bank Balance",
            amount: "₦10,150.99",
            color: Colors.pink,
          ),
          SalesItem(
            icon: Icons.attach_money,
            label: "Cash In Hand",
            amount: "₦10,150.99",
            color: Colors.green,
          ),
          SalesItem(
            icon: Icons.credit_score,
            label: "Sales on Credit",
            amount: "₦10,150.99",
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class SalesItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String amount;
  final Color color;

  const SalesItem({
    required this.icon,
    required this.label,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ),
          Text(
            amount,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
