import 'package:flutter/material.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/models/models.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.currentQuestionAnswered,
    required this.onNextQuestionPress,
    required this.selectedAnswer,
    required this.onSubmit,
    required this.lastQuestion,
  });

  final bool currentQuestionAnswered;
  final void Function() onNextQuestionPress;
  final Answer? selectedAnswer;
  final void Function(bool) onSubmit;
  final bool lastQuestion;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AnimatedOpacity(
      opacity: selectedAnswer == null ? 0 : 1,
      duration:
          selectedAnswer == null ? Duration.zero : const Duration(seconds: 1),
      child: GestureDetector(
        onTap: !currentQuestionAnswered
            ? () => onSubmit(selectedAnswer!.isCorrect)
            : onNextQuestionPress,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: 315,
          height: 65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: currentQuestionAnswered
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.primaryContainer,
          ),
          child: !currentQuestionAnswered
              ? Text(
                  l10n.submitButton,
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              : Text(
                  lastQuestion
                      ? l10n.finishQuizButton
                      : l10n.nextQuestionButton,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
        ),
      ),
    );
  }
}
