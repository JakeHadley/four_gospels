import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.onPressed,
    required this.answered,
  });

  final VoidCallback onPressed;
  final bool answered;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: !answered ? 0 : 1,
      duration: answered
          ? const Duration(seconds: 3)
          : const Duration(microseconds: 1),
      curve: Curves.easeInQuint,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(color: Colors.blueAccent),
        child: TextButton(
          onPressed: onPressed,
          child: const Text('Next'),
        ),
      ),
    );
  }
}
