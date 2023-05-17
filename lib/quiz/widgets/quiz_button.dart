import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/models/models.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    required this.currentQuestionAnswered,
    required this.onNextQuestionPress,
    required this.selectedAnswer,
    required this.onSubmit,
    required this.lastQuestion,
    super.key,
  });

  final bool currentQuestionAnswered;
  final void Function() onNextQuestionPress;
  final Answer? selectedAnswer;
  final void Function({required bool isCorrect}) onSubmit;
  final bool lastQuestion;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = !currentQuestionAnswered
        ? l10n.submitButton
        : lastQuestion
            ? l10n.finishQuizButton
            : l10n.nextQuestionButton;

    final color = currentQuestionAnswered
        ? Theme.of(context).primaryColor
        : Theme.of(context).colorScheme.primaryContainer;

    final onTap = !currentQuestionAnswered
        ? () => onSubmit(isCorrect: selectedAnswer!.isCorrect)
        : onNextQuestionPress;

    return AnimatedOpacity(
      opacity: selectedAnswer == null ? 0 : 1,
      duration:
          selectedAnswer == null ? Duration.zero : const Duration(seconds: 1),
      child: ActionButton(
        text: text,
        color: color,
        onTap: onTap,
      ),
    );
  }
}
