import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/multi_player_setup/bloc/multi_player_bloc.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class CreateGame extends StatelessWidget {
  const CreateGame({
    required this.controller,
    required this.isValid,
    required this.changeQuestions,
    required this.questions,
    required this.onContinue,
    required this.chips,
    required this.onStateChange,
    super.key,
  });

  final TextEditingController controller;
  final bool isValid;
  final void Function(int value) changeQuestions;
  final int questions;
  final VoidCallback onContinue;
  final List<Widget> chips;
  final VoidCallback onStateChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = !isValid ? theme.disabledColor : null;
    final l10n = context.l10n;

    // TODO: check into creating a random option for all difficulties
    // TODO: allow to choose the language of the quiz
    // TODO: allow for owner to change settings on lobby page

    return BlocConsumer<MultiPlayerBloc, MultiPlayerState>(
      listener: (context, state) {
        if (state is MultiPlayerActive) {
          onStateChange();
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Input(
                    controller: controller,
                    label: l10n.enterNameField,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l10n.numQuestions,
                    style: theme.textTheme.bodyLarge,
                  ),
                  NumberPicker(
                    axis: Axis.horizontal,
                    value: questions,
                    minValue: 10,
                    maxValue: 50,
                    onChanged: changeQuestions,
                    itemWidth: 50,
                    step: 5,
                  ),
                  Text(
                    l10n.confirmSettingsDifficulty,
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: chips,
                  ),
                  const Spacer(),
                  ActionButton(
                    onPress: onContinue,
                    isLoading: state is MultiPlayerLoading,
                    color: buttonColor,
                    text: l10n.continueButton,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
