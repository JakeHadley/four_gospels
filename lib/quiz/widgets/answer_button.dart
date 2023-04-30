import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:four_gospels/quiz/models/models.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answer,
    required this.currentQuestionAnswered,
    required this.onPress,
    required this.selectedAnswer,
    required this.quizType,
  });

  final Answer answer;
  final bool currentQuestionAnswered;
  final void Function(Answer, QuizType) onPress;
  final Answer? selectedAnswer;
  final QuizType quizType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var color =
        selectedAnswer == answer ? theme.disabledColor : theme.cardColor;
    var textTheme = theme.textTheme.bodyLarge;
    var shouldShowBadge = false;

    if (currentQuestionAnswered) {
      if (answer.isCorrect) {
        color = theme.colorScheme.primary;
        textTheme = textTheme?.copyWith(color: theme.cardColor);
        if (answer == selectedAnswer) {
          shouldShowBadge = true;
        }
      } else if (selectedAnswer?.key == answer.key) {
        color = theme.colorScheme.error;
        textTheme = textTheme?.copyWith(color: theme.cardColor);
      }
    }

    return GestureDetector(
      onTap: () => onPress(answer, quizType),
      child: badges.Badge(
        badgeContent: Text(
          '+10',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.merge(TextStyle(color: Theme.of(context).cardColor)),
        ),
        padding: const EdgeInsets.all(12),
        badgeColor: Theme.of(context).primaryColor,
        borderSide: BorderSide(
          color: Theme.of(context).primaryColorLight,
        ),
        showBadge: shouldShowBadge,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 16,
              ),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              duration: const Duration(milliseconds: 400),
              child: Text(
                answer.text,
                style: textTheme,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
