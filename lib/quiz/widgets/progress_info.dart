import 'package:flutter/material.dart';
import 'package:four_gospels/l10n/l10n.dart';

class ProgressInfo extends StatelessWidget {
  const ProgressInfo({
    super.key,
    required this.currentQuestionIndex,
    required this.numberOfQuestions,
  });

  final int currentQuestionIndex;
  final int numberOfQuestions;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${l10n.quizSubtitleQuestion} ${currentQuestionIndex + 1} '
          '${l10n.quizSubtitleOf} $numberOfQuestions',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            value: (currentQuestionIndex + 1) / numberOfQuestions,
            color: Theme.of(context).primaryColorDark,
            backgroundColor: Theme.of(context).primaryColorLight,
          ),
        ),
      ],
    );
  }
}
