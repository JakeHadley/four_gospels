import 'package:flutter/material.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/quiz/widgets/answer_button.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({
    super.key,
    required this.question,
    required this.answerList,
  });

  final Question question;
  final List<Answer> answerList;

  @override
  Widget build(BuildContext context) {
    final answerButtonList =
        answerList.map((answer) => AnswerButton(answer: answer)).toList();

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
