import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/quiz.dart';
import 'package:four_gospels/speed_setup/widgets/confirm_settings.dart';
import 'package:four_gospels/timer/timer.dart';

@RoutePage()
class SpeedSetupPage extends StatelessWidget {
  const SpeedSetupPage({super.key});

  void _onPress(BuildContext context) {
    final language = Localizations.localeOf(context).toLanguageTag();

    // TODO: Show settings for
    //  difficulty,
    //  language,
    //  time (15, 30, 45, 60)
    // TODO: Maintain maximum number of seconds

    // TODO: +5 seconds for correct answers,
    //  -1 second for wrong answers

    // TODO: change time bar to red with 5 seconds left

    final quizStartEvent = QuizStart.speed(
      numberOfQuestions: 0,
      mode: Mode.easy,
      language: language,
    );

    context.read<QuizBloc>().add(quizStartEvent);
  }

  void _onStateChange(BuildContext context) {
    context.router.replaceAll([const QuizRoute()]);
    context.read<TimerBloc>().add(const TimerStarted(duration: 60));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: CustomAppBar(title: l10n.speedRound),
      body: ConfirmSettings(
        onPress: () {
          _onPress(context);
        },
        onStateChange: () {
          _onStateChange(context);
        },
      ),
    );
  }
}
