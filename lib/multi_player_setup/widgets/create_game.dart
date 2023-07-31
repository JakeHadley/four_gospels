import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/multi_player_setup/bloc/multi_player_bloc.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class CreateGame extends StatelessWidget {
  const CreateGame({
    required this.controller,
    required this.isValid,
    required this.changePlayers,
    required this.changeQuestions,
    required this.players,
    required this.questions,
    required this.onContinue,
    required this.chips,
    required this.onStateChange,
    super.key,
  });

  final TextEditingController controller;
  final bool isValid;
  final void Function(int value) changePlayers;
  final void Function(int value) changeQuestions;
  final int players;
  final int questions;
  final VoidCallback onContinue;
  final List<Widget> chips;
  final VoidCallback onStateChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = isValid ? theme.primaryColor : theme.disabledColor;

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
                    label: 'Enter Your Name',
                  ),
                  const SizedBox(height: 10),
                  Text('Number of Players', style: theme.textTheme.bodyLarge),
                  NumberPicker(
                    axis: Axis.horizontal,
                    value: players,
                    minValue: 2,
                    maxValue: 6,
                    onChanged: changePlayers,
                    itemWidth: 50,
                  ),
                  Text(
                    'Number of Questions',
                    style: theme.textTheme.bodyLarge,
                  ),
                  NumberPicker(
                    axis: Axis.horizontal,
                    value: questions,
                    minValue: 10,
                    maxValue: 30,
                    onChanged: changeQuestions,
                    itemWidth: 50,
                    step: 5,
                  ),
                  Text('Mode', style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: chips,
                  ),
                  const Spacer(),
                  StartButton(
                    onPress: onContinue,
                    isLoading: state is MultiPlayerLoading,
                    color: buttonColor,
                    alternateText: 'Continue',
                    alternateHeight: 65,
                    alternateTextStyle: theme.textTheme.headlineMedium,
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
