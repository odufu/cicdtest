import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backAllowed;

  const AppBarWidget({
    Key? key,
    required this.title,
    this.backAllowed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.tertiary,
              spreadRadius: 1,
              blurRadius: 3)
        ],
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back Button
            if (backAllowed)
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
              )
            else
              const SizedBox(width: 24), // Space placeholder for alignment

            // Title
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            // Empty Space for Alignment
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }

  // Implement preferredSize for AppBar compatibility
  @override
  Size get preferredSize => const Size.fromHeight(60);
}
