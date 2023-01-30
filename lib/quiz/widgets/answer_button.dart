import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:four_gospels/quiz/models/answer.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answer,
    required this.currentQuestionAnswered,
    required this.onPress,
    required this.selectedAnswer,
    required this.selectedAnswerKey,
    required this.showBadgeKey,
  });

  final Answer answer;
  final bool currentQuestionAnswered;
  final void Function(Answer) onPress;
  final Answer? selectedAnswer;
  final String? selectedAnswerKey;
  final String? showBadgeKey;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).cardColor;
    var textTheme = Theme.of(context).textTheme.bodyLarge;
    if (currentQuestionAnswered) {
      if (answer.isCorrect) {
        color = Theme.of(context).colorScheme.primary;
        textTheme =
            textTheme?.merge(TextStyle(color: Theme.of(context).cardColor));
      } else if (selectedAnswerKey == answer.key) {
        color = Theme.of(context).colorScheme.error;
        textTheme =
            textTheme?.merge(TextStyle(color: Theme.of(context).cardColor));
      }
    } else if (selectedAnswer == answer) {
      color = Theme.of(context).disabledColor;
    }

    return GestureDetector(
      onTap: () => onPress(answer),
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
        showBadge: showBadgeKey == answer.key,
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
