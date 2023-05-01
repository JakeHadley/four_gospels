import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/quiz/widgets/widgets.dart';

class QuizContent extends StatelessWidget {
  const QuizContent({
    super.key,
    required this.onNextQuestionPress,
    required this.onAnswerPress,
    required this.onQuizEnded,
    required this.onSubmit,
  });

  final void Function() onNextQuestionPress;
  final void Function(Answer, QuizType) onAnswerPress;
  final void Function() onQuizEnded;
  final void Function(bool) onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizComplete) {
          onQuizEnded();
        }
      },
      builder: (context, state) {
        if (state is QuizLoaded) {
          final currentQuestion = state.questions[state.currentQuestionIndex];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const SizedBox(height: 15),
                if (state.type == QuizType.single)
                  const ProgressInfo()
                else
                  TimerInfo(quizState: state),
                RichText(
                  text: TextSpan(
                    text: currentQuestion.question
                        .replaceAll(r'\n', '\n')
                        .replaceAll(r'\t', '\t'),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    AnswerButton(
                      answer: state.answerList[0],
                      currentQuestionAnswered: state.currentQuestionAnswered,
                      onPress: onAnswerPress,
                      selectedAnswer: state.selectedAnswer,
                      quizType: state.type,
                    ),
                    AnswerButton(
                      answer: state.answerList[1],
                      currentQuestionAnswered: state.currentQuestionAnswered,
                      onPress: onAnswerPress,
                      selectedAnswer: state.selectedAnswer,
                      quizType: state.type,
                    ),
                    AnswerButton(
                      answer: state.answerList[2],
                      currentQuestionAnswered: state.currentQuestionAnswered,
                      onPress: onAnswerPress,
                      selectedAnswer: state.selectedAnswer,
                      quizType: state.type,
                    ),
                    AnswerButton(
                      answer: state.answerList[3],
                      currentQuestionAnswered: state.currentQuestionAnswered,
                      onPress: onAnswerPress,
                      selectedAnswer: state.selectedAnswer,
                      quizType: state.type,
                    )
                  ],
                ),
                if (state.type == QuizType.single) ...[
                  const SizedBox(height: 20),
                  Reference(
                    reference: currentQuestion.reference,
                    currentQuestionAnswered: state.currentQuestionAnswered,
                  ),
                  const SizedBox(height: 10),
                  QuizButton(
                    currentQuestionAnswered: state.currentQuestionAnswered,
                    onNextQuestionPress: onNextQuestionPress,
                    selectedAnswer: state.selectedAnswer,
                    onSubmit: onSubmit,
                    lastQuestion:
                        state.numberOfQuestions - state.currentQuestionIndex ==
                            1,
                  ),
                ],
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
