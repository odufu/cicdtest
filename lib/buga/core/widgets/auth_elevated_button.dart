import 'package:flutter/material.dart';

class AuthElevatedButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color color;
  final bool isActive;

  const AuthElevatedButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    required this.backgroundColor,
    required this.color,
    this.isActive = true, // Default value is active
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          isActive ? onPressed : null, // Disable button if isActive is false
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 54),
        backgroundColor: isActive
            ? backgroundColor
            : Colors.grey, // Change color if inactive
        foregroundColor: Colors.transparent,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color:
              isActive ? color : Colors.white, // Adjust text color if inactive
        ),
      ),
    );
  }
}
