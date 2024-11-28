import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RevenueWidget extends StatelessWidget {
  IconData icon;
  String title;
  Color? color;
  String account;
  void Function()? tap;
  RevenueWidget({
    required this.account,
    this.tap,
    this.color,
    required this.icon,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tap,
      title: Text(title, style: const TextStyle(fontSize: 20)),
      leading: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: color?.withOpacity(.3) ??
                Theme.of(context).colorScheme.primary.withOpacity(.3)),
        child: Icon(
          icon,
          color: color,
        ),
      ),
      trailing: Text(
        "₦$account",
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
