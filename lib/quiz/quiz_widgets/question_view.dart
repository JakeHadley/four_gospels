import 'package:flutter/material.dart';
import 'package:four_gospels/quiz/quiz_widgets/answer_button.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({
    super.key,
    required this.onPressed,
    required this.answered,
    required this.answerSelected,
  });

  final void Function({
    required String answer,
    required bool isCorrect,
  }) onPressed;
  final bool answered;
  final String answerSelected;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // 'Lots of text here that is a question about it',
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut more text that will wrap but also needs to scale',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  AnswerButton(
                    answered: answered,
                    isCorrect: true,
                    onPressed: onPressed,
                    answerKey: 'A',
                    answerSelected: answerSelected,
                  ),
                  AnswerButton(
                    answered: answered,
                    isCorrect: false,
                    onPressed: onPressed,
                    answerKey: 'B',
                    answerSelected: answerSelected,
                  ),
                  AnswerButton(
                    answered: answered,
                    isCorrect: false,
                    onPressed: onPressed,
                    answerKey: 'C',
                    answerSelected: answerSelected,
                  ),
                  AnswerButton(
                    answered: answered,
                    isCorrect: false,
                    onPressed: onPressed,
                    answerKey: 'D',
                    answerSelected: answerSelected,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
