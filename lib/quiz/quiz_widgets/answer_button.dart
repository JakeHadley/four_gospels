import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answered,
    required this.isCorrect,
    required this.onPressed,
    required this.answerKey,
    required this.answerSelected,
  });

  final bool answered;
  final bool isCorrect;
  final void Function({
    required String answer,
    required bool isCorrect,
  }) onPressed;
  final String answerKey;
  final String answerSelected;

  @override
  Widget build(BuildContext context) {
    var color = Colors.white;
    if (answered) {
      if (isCorrect) {
        color = Colors.green;
      } else if (answerSelected == answerKey) {
        color = Colors.red;
      }
    }

    return FractionallySizedBox(
      widthFactor: 0.8,
      child: GestureDetector(
        onTap: () => onPressed(
          answer: answerKey,
          isCorrect: isCorrect,
        ),
        child: AnimatedContainer(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          duration: const Duration(microseconds: 300),
          child: const Text(
            // 'A. LOTS OF text',
            'Lots of text here that describes something about the way the answer is going to be written in a large format',
          ),
        ),
      ),
    );
  }
}
