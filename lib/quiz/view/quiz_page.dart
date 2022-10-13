import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/widgets/widgets.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizLoading) {
          return Scaffold(
            appBar: AppBar(),
            body: const Text('loading'),
          );
        }
        if (state is QuizLoadedSingle) {
          return Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text(
                'Single Player',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .merge(const TextStyle(color: Colors.white)),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProgressBar(
                  currentQuestionIndex: state.currentQuestionIndex,
                  numberOfQuestions: state.numberOfQuestions,
                  numberOfPoints: state.numberOfPoints,
                ),
                QuestionView(
                  question: state.questions[state.currentQuestionIndex],
                  answerList: state.answerList,
                ),
                NextButton(
                  currentQuestionAnswered: state.currentQuestionAnswered,
                ),
              ],
            ),
          );
        }
        return const Text('Error');
      },
    );
  }
}
