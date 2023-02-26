import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/speed_setup/widgets/confirm_settings.dart';

class SpeedSetupPage extends StatelessWidget {
  const SpeedSetupPage({super.key});

  void _onPress(BuildContext context) {
    context.read<QuizBloc>().add(QuizSpeedStart());
  }

  void _onStateChange(BuildContext context) {
    context.router.replaceAll([const QuizRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: CustomAppBar(height: 75, title: l10n.speedRound),
      body: ConfirmSettings(
        onPress: _onPress,
        onStateChange: _onStateChange,
      ),
    );
  }
}
