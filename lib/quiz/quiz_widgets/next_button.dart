import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: TextButton(
        onPressed: onPressed,
        child: const Text('Next'),
      ),
    );
  }
}
