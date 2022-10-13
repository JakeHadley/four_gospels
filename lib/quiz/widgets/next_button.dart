import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.currentQuestionAnswered,
  });

  final bool currentQuestionAnswered;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: !currentQuestionAnswered ? 0 : 1,
      duration: currentQuestionAnswered
          ? const Duration(seconds: 3)
          : const Duration(microseconds: 1),
      curve: Curves.easeInQuint,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(color: Colors.blueAccent),
        child: TextButton(
          onPressed: () => context
              .read<QuizBloc>()
              .add(const QuizSinglePlayerNextQuestion()),
          child: const Text('Next'),
        ),
      ),
    );
  }
}
