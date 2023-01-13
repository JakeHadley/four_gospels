import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/quiz/widgets/quiz_content.dart';

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
          QuizSinglePlayerAnswered(
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
    context.read<QuizBloc>().add(const QuizSinglePlayerNextQuestion());
    setState(() {
      _selectedAnswer = null;
      _showBadgeKey = null;
    });
  }

  void _onQuizEnded() {
    context.router.replaceAll([const EndGameRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 75, title: 'Single Player'),
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
}
