import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/multi_player_setup/bloc/multi_player_bloc.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class GameCreation extends StatelessWidget {
  const GameCreation({
    required this.controller,
    required this.isValid,
    required this.changePlayers,
    required this.changeQuestions,
    required this.players,
    required this.questions,
    required this.onStart,
    required this.chips,
    super.key,
  });

  final TextEditingController controller;
  final bool isValid;
  final void Function(int value) changePlayers;
  final void Function(int value) changeQuestions;
  final int players;
  final int questions;
  final void Function(BuildContext context) onStart;
  final List<Widget> chips;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = isValid ? theme.primaryColor : theme.disabledColor;

    return BlocConsumer<MultiPlayerBloc, MultiPlayerState>(
      listener: (context, state) {
        if (state is MultiPlayerActive) {
          context.router.navigate(const LobbyRoute());
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
                    onPress: onStart,
                    isLoading: state is MultiPlayerLoading,
                    color: buttonColor,
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
