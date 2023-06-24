import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

class ConfirmSettings extends StatelessWidget {
  const ConfirmSettings({
    required this.mode,
    required this.numberQuestions,
    required this.onPress,
    required this.onStateChange,
    super.key,
  });

  final Mode mode;
  final int numberQuestions;
  final void Function(BuildContext context) onPress;
  final void Function(BuildContext context) onStateChange;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizLoaded) {
          onStateChange(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    l10n.confirmSettingsSubtitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              const SizedBox(height: 54),
              InfoBox(
                text1: '${l10n.confirmSettingsDifficulty}: '
                    '${mode.toStringIntl(l10n)}',
                text2: '${l10n.confirmSettingsNumberQuestions}: '
                    '$numberQuestions',
              ),
              const Spacer(),
              StartButton(
                onPress: onPress,
                isLoading: state is QuizLoading,
              ),
              const SizedBox(height: 38)
            ],
          ),
        );
      },
    );
  }
}
