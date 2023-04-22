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

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Answer? _selectedAnswer;
  String? _showBadgeKey;

  void _onAnswerPress(Answer answer) {
    setState(() {
      _selectedAnswer = answer;
    });
  }

  void _submitAction() {
    context.read<QuizBloc>().add(
          QuizAnsweredQuestion(
            selectedAnswerKey: _selectedAnswer!.key,
            isCorrect: _selectedAnswer!.isCorrect,
          ),
        );
    if (_selectedAnswer!.isCorrect) {
      setState(() {
        _showBadgeKey = _selectedAnswer?.key;
      });
    }
  }

  void _nextQuestionAction() {
    context.read<QuizBloc>().add(const QuizNextQuestion());
    setState(() {
      _selectedAnswer = null;
      _showBadgeKey = null;
    });
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
                nextQuestionAction: _nextQuestionAction,
                onAnswerPress: _onAnswerPress,
                onQuizEnded: _onQuizEnded,
                selectedAnswer: _selectedAnswer,
                showBadgeKey: _showBadgeKey,
                submitAction: _submitAction,
              ),
            );
          }
          return const Text('Error');
        },
      ),
    );
  }
}
