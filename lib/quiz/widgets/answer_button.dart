import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/models/answer.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer});

  final Answer answer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizLoadedSingle) {
          var color = Colors.white;
          if (state.currentQuestionAnswered) {
            if (answer.isCorrect) {
              color = Colors.green;
            } else if (state.selectedAnswerKey == answer.key) {
              color = Colors.red;
            }
          }

          return FractionallySizedBox(
            widthFactor: 0.8,
            child: GestureDetector(
              onTap: !state.currentQuestionAnswered
                  ? () => context.read<QuizBloc>().add(
                        QuizSinglePlayerAnswered(
                          selectedAnswerKey: answer.key,
                          isCorrect: answer.isCorrect,
                        ),
                      )
                  : null,
              child: AnimatedContainer(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                duration: state.currentQuestionAnswered
                    ? const Duration(seconds: 1)
                    : const Duration(microseconds: 1),
                child: Text(answer.text),
              ),
            ),
          );
        }
        return const Text('Error');
      },
    );
  }
}
