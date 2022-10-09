import 'package:flutter/material.dart';

import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/quiz/widgets/answer_button.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({
    super.key,
    required this.onPressed,
    required this.answered,
    required this.answerSelected,
    required this.question,
  });

  final void Function({
    required String answer,
    required bool isCorrect,
  }) onPressed;
  final bool answered;
  final String answerSelected;
  final Question question;

  @override
  Widget build(BuildContext context) {
    final answerButtonList = [
      AnswerButton(
        answered: answered,
        isCorrect: true,
        onPressed: onPressed,
        answerKey: 'A',
        answerSelected: answerSelected,
        answerText: question.correctAnswer,
      ),
      AnswerButton(
        answered: answered,
        isCorrect: false,
        onPressed: onPressed,
        answerKey: 'B',
        answerSelected: answerSelected,
        answerText: question.wrongAnswer1,
      ),
      AnswerButton(
        answered: answered,
        isCorrect: false,
        onPressed: onPressed,
        answerKey: 'C',
        answerSelected: answerSelected,
        answerText: question.wrongAnswer2,
      ),
      AnswerButton(
        answered: answered,
        isCorrect: false,
        onPressed: onPressed,
        answerKey: 'D',
        answerSelected: answerSelected,
        answerText: question.wrongAnswer3,
      ),
    ];
    answerButtonList.shuffle();

    return Flexible(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                question.question,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              Column(children: answerButtonList)
            ],
          ),
        ),
      ),
    );
  }
}
