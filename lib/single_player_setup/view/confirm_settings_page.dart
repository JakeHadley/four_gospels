import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

class ConfirmSettingsPage extends StatelessWidget {
  const ConfirmSettingsPage({
    super.key,
    required this.mode,
    required this.numberQuestions,
  });

  final Mode mode;
  final int numberQuestions;

  void _onPress(BuildContext context) {
    context.read<QuizBloc>().add(QuizSinglePlayerStart(numberQuestions, mode));
  }

  void _onStateChange(BuildContext context) {
    context.router.push(const QuizRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 75, title: 'Single Player'),
      body: ConfirmSettings(
        mode: mode,
        numberQuestions: numberQuestions,
        onPress: _onPress,
        onStateChange: _onStateChange,
      ),
    );
  }
}
