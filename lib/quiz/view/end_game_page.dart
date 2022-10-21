import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/widgets/widgets.dart';

class EndGamePage extends StatelessWidget {
  const EndGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizEnded) {
          return Scaffold(
            appBar: const QuizAppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Number of Points: ${state.numberOfPoints.toString()}'),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(color: Colors.blueAccent),
                    child: TextButton(
                      onPressed: () => context.router.popUntilRoot(),
                      child: const Text('Home'),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Text('Error');
      },
    );
  }
}
