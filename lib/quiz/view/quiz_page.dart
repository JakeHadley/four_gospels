import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/quiz/widgets/back_button_dialog.dart';
import 'package:four_gospels/quiz/widgets/widgets.dart';
import 'package:four_gospels/timer/bloc/timer_bloc.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void _onAnswerPress(Answer answer, QuizType type) {
    switch (type) {
      case QuizType.single:
        context.read<QuizBloc>().add(QuizAnswerSelected(answer: answer));
        break;
      case QuizType.speed:
        context.read<QuizBloc>().add(QuizAnswerSelected(answer: answer));
        context
            .read<QuizBloc>()
            .add(QuizAnswerSubmitted(isCorrect: answer.isCorrect));

        if (answer.isCorrect) {
          context.read<TimerBloc>().add(const TimerAdded(duration: 10));
        }
        if (mounted) {
          Future.delayed(const Duration(seconds: 1), () {
            context.read<QuizBloc>().add(QuizNextQuestion());
          });
        }
        break;
      case QuizType.multi:
        // TODO: Handle this case.
        break;
    }
  }

  void _onSubmit(bool isCorrect) {
    context.read<QuizBloc>().add(QuizAnswerSubmitted(isCorrect: isCorrect));
  }

  void _onNextQuestionPress() {
    context.read<QuizBloc>().add(QuizNextQuestion());
  }

  void _onQuizEnded() {
    context.router.replaceAll([const EndGameRoute()]);
  }

  Future<bool> _onWillPop() async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const BackButtonDialog(),
        ) ??
        false;
  }

  String _getTitle(QuizType type, AppLocalizations l10n) {
    switch (type) {
      case QuizType.single:
        return l10n.singlePlayerAppBar;
      case QuizType.speed:
        return l10n.speedRoundAppBar;
      case QuizType.multi:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizLoaded) {
            return Scaffold(
              appBar: CustomAppBar(
                height: 75,
                title: _getTitle(state.type, l10n),
                backButton: const QuizBackButton(),
              ),
              body: QuizContent(
                onNextQuestionPress: _onNextQuestionPress,
                onAnswerPress: _onAnswerPress,
                onQuizEnded: _onQuizEnded,
                onSubmit: _onSubmit,
              ),
            );
          }
          return const Scaffold();
        },
      ),
    );
  }
}
