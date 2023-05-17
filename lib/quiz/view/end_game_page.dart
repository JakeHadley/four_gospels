import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/widgets/widgets.dart';

@RoutePage()
class EndGamePage extends StatelessWidget {
  const EndGamePage({super.key});

  void _onPress(BuildContext context) {
    context.router.replaceAll([const HomeRoute()]);
    context.read<QuizBloc>().add(QuizFinished());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: CustomAppBar(title: l10n.singlePlayerAppBar),
      body: EndGameContent(onPress: _onPress),
    );
  }
}
