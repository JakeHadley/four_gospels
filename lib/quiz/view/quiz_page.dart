import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/quiz/widgets/back_button_dialog.dart';
import 'package:four_gospels/quiz/widgets/widgets.dart';
import 'package:four_gospels/timer/bloc/timer_bloc.dart';

@RoutePage()
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void _onAnswerPress({
    required Answer answer,
    required QuizType quizType,
    required Mode questionMode,
  }) {
    switch (quizType) {
      case QuizType.single:
        context.read<QuizBloc>().add(QuizAnswerSelected(answer: answer));
        break;
      case QuizType.speed:
        context.read<QuizBloc>().add(QuizAnswerSelected(answer: answer));
        context
            .read<QuizBloc>()
            .add(QuizAnswerSubmitted(isCorrect: answer.isCorrect));

        if (answer.isCorrect) {
          context.read<TimerBloc>().add(const TimerChanged(duration: 5));
        } else {
          context.read<TimerBloc>().add(const TimerChanged(duration: -1));
        }

        if (mounted) {
          Future.delayed(const Duration(seconds: 1), () {
            context
                .read<QuizBloc>()
                .add(QuizNextQuestion(questionMode: questionMode));
          });
        }
        break;
      case QuizType.multi:
        context.read<QuizBloc>().add(QuizAnswerSelected(answer: answer));
        break;
    }
  }

  void _onSubmit({
    required bool isCorrect,
    required QuizType quizType,
  }) {
    context.read<QuizBloc>().add(QuizAnswerSubmitted(isCorrect: isCorrect));

    if (quizType == QuizType.multi) {
      context.read<MultiPlayerBloc>().add(MultiPlayerSubmitAnswer());
    }
  }

  void _advanceMultiPlayerQuestion({required int indexToSet}) {
    context.read<QuizBloc>().add(
          QuizNextQuestion(
            indexToSet: indexToSet,
            questionMode: Mode.easy,
          ),
        );
  }

  void _onNextQuestionPress({
    required QuizType quizType,
    required Mode questionMode,
  }) {
    context.read<QuizBloc>().add(QuizNextQuestion(questionMode: questionMode));

    if (quizType == QuizType.multi) {
      context.read<MultiPlayerBloc>().add(MultiPlayerNextQuestion());
    }
  }

  void _onQuizEnded({
    required int score,
    required QuizType quizType,
  }) {
    context.router.replaceAll([EndGameRoute(quizType: quizType)]);

    if (quizType == QuizType.multi) {
      context.read<MultiPlayerBloc>().add(MultiPlayerComplete(score: score));
    }
  }

  void _exitAction() {
    context.read<QuizBloc>().add(QuizFinished());
    context.read<MultiPlayerBloc>().add(MultiPlayerReset());
    context.read<TimerBloc>().add(TimerReset());
    context.router.replaceAll([const HomeRoute()]);
  }

  Future<bool> _onWillPop() async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => BackButtonDialog(
            exitAction: _exitAction,
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // TODO: Feedback button to dispute a question/set of answers

    return WillPopScope(
      onWillPop: _onWillPop,
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizLoaded) {
            return Scaffold(
              appBar: CustomAppBar(
                title: state.type.toStringIntl(l10n),
                backButton: QuizBackButton(exitAction: _exitAction),
              ),
              body: QuizContent(
                onNextQuestionPress: _onNextQuestionPress,
                onAnswerPress: _onAnswerPress,
                onQuizEnded: _onQuizEnded,
                onSubmit: _onSubmit,
                advanceMultiPlayerQuestion: _advanceMultiPlayerQuestion,
              ),
            );
          }
          return const Scaffold();
        },
      ),
    );
  }
}
