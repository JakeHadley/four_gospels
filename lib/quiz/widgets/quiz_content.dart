import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/quiz/widgets/widgets.dart';

class QuizContent extends StatelessWidget {
  const QuizContent({
    super.key,
    required this.nextQuestionAction,
    required this.onAnswerPress,
    required this.onQuizEnded,
    required this.selectedAnswer,
    required this.showBadgeKey,
    required this.submitAction,
  });

  final void Function() nextQuestionAction;
  final void Function(Answer) onAnswerPress;
  final void Function() onQuizEnded;
  final Answer? selectedAnswer;
  final String? showBadgeKey;
  final void Function() submitAction;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizEnded) {
          onQuizEnded();
        }
      },
      builder: (context, state) {
        if (state is QuizLoadedSingle) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const SizedBox(height: 15),
                ProgressInfo(
                  currentQuestionIndex: state.currentQuestionIndex,
                  numberOfQuestions: state.numberOfQuestions,
                ),
                RichText(
                  text: TextSpan(
                    text: state.questions[state.currentQuestionIndex].question
                        .replaceAll(r'\n', '\n')
                        .replaceAll(r'\t', '\t'),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                const Spacer(),
                AnswerButtonList(
                  answerList: state.answerList,
                  currentQuestionAnswered: state.currentQuestionAnswered,
                  onAnswerPress: onAnswerPress,
                  selectedAnswer: selectedAnswer,
                  selectedAnswerKey: state.selectedAnswerKey,
                  showBadgeKey: showBadgeKey,
                ),
                const SizedBox(height: 20),
                ActionButton(
                  currentQuestionAnswered: state.currentQuestionAnswered,
                  nextQuestionAction: nextQuestionAction,
                  selectedAnswer: selectedAnswer,
                  submitAction: submitAction,
                  lastQuestion:
                      state.numberOfQuestions - state.currentQuestionIndex == 1,
                ),
                const SizedBox(height: 20)
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
