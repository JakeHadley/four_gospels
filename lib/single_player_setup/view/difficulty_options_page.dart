import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

class DifficultyOptionsPage extends StatelessWidget {
  const DifficultyOptionsPage({super.key});

  void _onPress(BuildContext context, Mode mode) {
    context.router.push(NumberQuestionsRoute(mode: mode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 75, title: 'Single Player'),
      body: DifficultyOptions(onPress: _onPress),
    );
  }
}
