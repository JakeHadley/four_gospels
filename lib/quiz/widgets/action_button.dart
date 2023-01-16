import 'package:flutter/material.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/models/models.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.currentQuestionAnswered,
    required this.nextQuestionAction,
    required this.selectedAnswer,
    required this.submitAction,
    required this.lastQuestion,
  });

  final bool currentQuestionAnswered;
  final void Function() nextQuestionAction;
  final Answer? selectedAnswer;
  final void Function() submitAction;
  final bool lastQuestion;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AnimatedOpacity(
      opacity: selectedAnswer == null ? 0 : 1,
      duration:
          selectedAnswer == null ? Duration.zero : const Duration(seconds: 1),
      child: GestureDetector(
        onTap: !currentQuestionAnswered ? submitAction : nextQuestionAction,
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
                  style: Theme.of(context).textTheme.headline4,
                )
              : Text(
                  lastQuestion
                      ? l10n.finishQuizButton
                      : l10n.nextQuestionButton,
                  style: Theme.of(context).textTheme.headline4,
                ),
        ),
      ),
    );
  }
}
