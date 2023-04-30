import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/quiz/quiz.dart';
import 'package:four_gospels/timer/timer.dart';

class TimerInfo extends StatelessWidget {
  const TimerInfo({super.key, required this.quizState});

  final QuizState quizState;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerBloc, TimerState>(
      listener: (context, state) {
        if (state is TimerRunComplete) {
          context.read<QuizBloc>().add(QuizEnded());
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            LinearProgressIndicator(
              value: state.duration.toDouble() / 60,
              minHeight: 20,
            ),
            Align(
              child: Text(state.duration.toString()),
            )
          ],
        );
      },
    );
  }
}
