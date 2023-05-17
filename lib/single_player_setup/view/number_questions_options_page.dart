import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/models/mode.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

@RoutePage()
class NumberQuestionsPage extends StatelessWidget {
  const NumberQuestionsPage({
    required this.mode,
    super.key,
  });

  final Mode mode;

  void _onPress(BuildContext context, int num) {
    context.router.push(
      ConfirmSettingsRoute(mode: mode, numberQuestions: num),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: CustomAppBar(title: l10n.singlePlayerAppBar),
      body: NumberQuestionOptions(mode: mode, onPress: _onPress),
    );
  }
}
