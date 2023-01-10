import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/quiz/models/mode.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

class NumberQuestionsPage extends StatelessWidget {
  const NumberQuestionsPage({super.key, required this.mode});

  final Mode mode;

  void _onPress(BuildContext context, int num) {
    context.router.push(
      ConfirmSettingsRoute(mode: mode, numberQuestions: num),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 75, title: 'Single Player'),
      body: NumberQuestionOptions(mode: mode, onPress: _onPress),
    );
  }
}
