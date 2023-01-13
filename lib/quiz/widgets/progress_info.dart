import 'package:flutter/material.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'question ${currentQuestionIndex + 1} '
          'of $numberOfQuestions',
          style: Theme.of(context).textTheme.subtitle2,
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
