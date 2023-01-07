import 'package:flutter/material.dart';
import 'package:four_gospels/quiz/models/mode.dart';

class NumberQuestionOptions extends StatelessWidget {
  const NumberQuestionOptions({
    super.key,
    required Mode mode,
  }) : _mode = mode;

  final Mode _mode;

  //   context.router.push(const QuizRoute());
  //   context.read<QuizBloc>().add(
  //         QuizSinglePlayerStart(
  //           selectedQuestionItem!.num,
  //           selectedModeItem!.mode,
  //         ),
  //       );

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(_mode.toString()));
  }
}
