import 'package:flutter/material.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/quiz/widgets/answer_button.dart';

class AnswerButtonList extends StatelessWidget {
  const AnswerButtonList({
    super.key,
    required this.answerList,
    required this.currentQuestionAnswered,
    required this.onAnswerPress,
    required this.selectedAnswer,
    required this.selectedAnswerKey,
    required this.showBadgeKey,
  });

  final List<Answer> answerList;
  final bool currentQuestionAnswered;
  final void Function(Answer) onAnswerPress;
  final Answer? selectedAnswer;
  final String selectedAnswerKey;
  final String? showBadgeKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnswerButton(
          answer: answerList[0],
          currentQuestionAnswered: currentQuestionAnswered,
          onPress: onAnswerPress,
          selectedAnswer: selectedAnswer,
          selectedAnswerKey: selectedAnswerKey,
          showBadgeKey: showBadgeKey,
        ),
        AnswerButton(
          answer: answerList[1],
          currentQuestionAnswered: currentQuestionAnswered,
          onPress: onAnswerPress,
          selectedAnswer: selectedAnswer,
          selectedAnswerKey: selectedAnswerKey,
          showBadgeKey: showBadgeKey,
        ),
        AnswerButton(
          answer: answerList[2],
          currentQuestionAnswered: currentQuestionAnswered,
          onPress: onAnswerPress,
          selectedAnswer: selectedAnswer,
          selectedAnswerKey: selectedAnswerKey,
          showBadgeKey: showBadgeKey,
        ),
        AnswerButton(
          answer: answerList[3],
          currentQuestionAnswered: currentQuestionAnswered,
          onPress: onAnswerPress,
          selectedAnswer: selectedAnswer,
          selectedAnswerKey: selectedAnswerKey,
          showBadgeKey: showBadgeKey,
        )
      ],
    );
  }
}
