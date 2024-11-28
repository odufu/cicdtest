import 'package:flutter/material.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../widgets/foot_trafic.dart';
import '../widgets/inventry_turn_over.dart';
import '../widgets/quick_access_screen.dart';
import '../widgets/sales_revenure_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              child: const Icon(Icons.person, color: Colors.purple),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bezalel & Sons',
                  style: TextStyle(color: Colors.blueGrey[900], fontSize: 15),
                ),
                Text(
                  'Admin',
                  style: TextStyle(
                    color: Colors.blueGrey[700],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.blueGrey[900],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.headset_mic),
              color: Colors.blueGrey[700],
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.cyanAccent,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.card_giftcard),
              color: Colors.amberAccent,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(),
            const SalesRevenueCard(), // Insert SalesRevenueCard with tabs here
            QuickAccessScreen(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [InventryTurnOver(), FootTrafic()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
