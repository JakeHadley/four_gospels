import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/quiz/widgets/widgets.dart';

class QuizContent extends StatelessWidget {
  const QuizContent({
    required this.onNextQuestionPress,
    required this.onAnswerPress,
    required this.onQuizEnded,
    required this.onSubmit,
    required this.advanceMultiPlayerQuestion,
    super.key,
  });

  final void Function({
    required QuizType quizType,
    required Mode questionMode,
  }) onNextQuestionPress;
  final void Function({
    required Answer answer,
    required QuizType quizType,
    required Mode questionMode,
  }) onAnswerPress;
  final void Function({
    required int score,
    required QuizType quizType,
  }) onQuizEnded;
  final void Function({
    required bool isCorrect,
    required QuizType quizType,
  }) onSubmit;
  final void Function({required int indexToSet}) advanceMultiPlayerQuestion;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, quizState) {
        if (quizState is QuizComplete) {
          onQuizEnded(
            score: quizState.numberOfPoints,
            quizType: quizState.type,
          );
        }
      },
      builder: (context, quizState) {
        return BlocConsumer<MultiPlayerBloc, MultiPlayerState>(
          listener: (context, multiState) {
            if (multiState is MultiPlayerActive && quizState is QuizLoaded) {
              if (quizState.currentQuestionIndex !=
                  multiState.room.currentQuestionIndex) {
                advanceMultiPlayerQuestion(
                  indexToSet: multiState.room.currentQuestionIndex,
                );
              }
            }
          },
          builder: (context, multiState) {
            final isMulti = multiState is MultiPlayerActive;
            final isMultiOwner =
                isMulti && multiState.name == multiState.room.owner;

            if (quizState is QuizLoaded) {
              final currentQuestion =
                  quizState.questions[quizState.currentQuestionIndex];

              final answers = quizState.answerList
                  .map(
                    (answer) => AnswerButton(
                      answer: answer,
                      currentQuestionAnswered:
                          quizState.currentQuestionAnswered,
                      onPress: onAnswerPress,
                      selectedAnswer: quizState.selectedAnswer,
                      quizType: quizState.type,
                      questionMode: currentQuestion.mode,
                    ),
                  )
                  .toList();

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    if (quizState.type == QuizType.speed)
                      TimerInfo(quizState: quizState)
                    else
                      ProgressInfo(),
                    RichText(
                      text: TextSpan(
                        text: currentQuestion.question
                            .replaceAll(r'\n', '\n')
                            .replaceAll(r'\t', '\t'),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    const Spacer(),
                    Column(children: answers),
                    if (quizState.type != QuizType.speed) ...[
                      const SizedBox(height: 20),
                      Reference(
                        reference: currentQuestion.reference,
                        currentQuestionAnswered:
                            quizState.currentQuestionAnswered,
                      ),
                      const SizedBox(height: 10),
                      QuizButton(
                        currentQuestionAnswered:
                            quizState.currentQuestionAnswered,
                        onNextQuestionPress: onNextQuestionPress,
                        selectedAnswer: quizState.selectedAnswer,
                        onSubmit: onSubmit,
                        lastQuestion: quizState.numberOfQuestions -
                                quizState.currentQuestionIndex ==
                            1,
                        quizType: quizState.type,
                        isMulti: isMulti,
                        isMultiOwner: isMultiOwner,
                        questionMode: currentQuestion.mode,
                      ),
                    ],
                    const SizedBox(height: 20),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
