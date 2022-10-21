import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/widgets/widgets.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizEnded) {
          context.router.push(const EndGameRoute());
        }
      },
      builder: (context, state) {
        if (state is QuizLoading || state is QuizEnded) {
          return Scaffold(
            appBar: AppBar(),
            body: const Text('loading'),
          );
        }
        if (state is QuizLoadedSingle) {
          return Scaffold(
            appBar: const QuizAppBar(),
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
