import 'package:flutter/material.dart';
import 'package:four_gospels/quiz/models/mode.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

class NumberQuestionsPage extends StatelessWidget {
  const NumberQuestionsPage({
    super.key,
    required Mode mode,
  }) : _mode = mode;

  final Mode _mode;

  @override
  Widget build(BuildContext context) {
    return NumberQuestionOptions(mode: _mode);
  }
}
