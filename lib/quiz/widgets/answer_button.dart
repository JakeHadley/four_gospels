import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answered,
    required this.isCorrect,
    required this.onPressed,
    required this.answerKey,
    required this.answerSelected,
    required this.answerText,
  });

  final bool answered;
  final bool isCorrect;
  final void Function({
    required String answer,
    required bool isCorrect,
  }) onPressed;
  final String answerKey;
  final String answerSelected;
  final String answerText;

  void onButtonPressed() {
    onPressed(
      answer: answerKey,
      isCorrect: isCorrect,
    );
  }

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
        onTap: !answered ? onButtonPressed : null,
        child: AnimatedContainer(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          duration: const Duration(seconds: 1),
          child: Text(answerText),
        ),
      ),
    );
  }
}
