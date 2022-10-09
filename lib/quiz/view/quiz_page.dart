import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';

import '../widgets/widgets.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool answered = false;
  bool correct = false;
  String answerSelected = '';

  // void onAnswerPressed({required bool isCorrect}) {
  //   setState(() {
  //     answered = true;
  //     correct = isCorrect;
  //   });
  // }

  void onAnswerPressed({
    required String answer,
    required bool isCorrect,
  }) {
    setState(() {
      answered = true;
      answerSelected = answer;
      correct = isCorrect;
    });
  }

  void onNextPressed() {
    answered = false;
    context
        .read<QuizBloc>()
        .add(QuizSinglePlayerNextQuestion(correct: correct));
  }

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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProgressBar(
                  numberOfQuestions: state.numberOfQuestions,
                  numberOfPoints: state.numberOfPoints,
                  currentQuestionIndex: state.currentQuestionIndex,
                ),
                QuestionView(
                  onPressed: onAnswerPressed,
                  answered: answered,
                  answerSelected: answerSelected,
                  question: state.questions[state.currentQuestionIndex],
                ),
                NextButton(
                  onPressed: onNextPressed,
                  answered: answered,
                ),
              ],
            ),
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
          );
        }
        return const Text('Error');
      },
    );
  }
}
