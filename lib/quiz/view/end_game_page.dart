import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/widgets/widgets.dart';

class EndGamePage extends StatelessWidget {
  const EndGamePage({super.key});

  void _onPress(BuildContext context) {
    context.router.replaceAll([const HomeRoute()]);
    context.read<QuizBloc>().add(QuizSingleFinished());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 75, title: 'Single Player'),
      body: EndGameContent(onPress: _onPress),
    );
  }
}
