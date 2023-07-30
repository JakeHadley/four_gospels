import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/helpers/helpers.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/quiz/widgets/widgets.dart';

@RoutePage()
class EndGamePage extends StatelessWidget {
  const EndGamePage({required this.quizType, super.key});

  final QuizType quizType;

  void _onPress(BuildContext context) {
    context.router.replaceAll([const HomeRoute()]);
    context.read<QuizBloc>().add(QuizFinished());
    context.read<MultiPlayerBloc>().add(MultiPlayerReset());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: CustomAppBar(title: getTitle(quizType, l10n)),
      body: EndGameContent(onPress: _onPress),
    );
  }
}
