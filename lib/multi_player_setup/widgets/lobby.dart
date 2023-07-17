import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/models/models.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

class Lobby extends StatelessWidget {
  const Lobby({
    required this.onStart,
    required this.onBack,
    required this.onMultiStateChange,
    required this.onQuizStateChange,
    super.key,
  });

  final void Function(String code) onStart;
  final VoidCallback onBack;
  final void Function(Room room) onMultiStateChange;
  final VoidCallback onQuizStateChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizLoaded) {
          onQuizStateChange();
        }
      },
      child: BlocConsumer<MultiPlayerBloc, MultiPlayerState>(
        listener: (context, state) {
          if (state is MultiPlayerActive) {
            if (state.room.status == 'active') {
              onMultiStateChange(state.room);
            }
          }
        },
        builder: (context, state) {
          if (state is MultiPlayerActive) {
            final room = state.room;

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GameInfo(
                        code: room.code,
                        numberOfPlayers: room.numberOfPlayers,
                        numberOfQuestions: room.numberOfQuestions,
                      ),
                      PlayerList(users: room.users),
                      if (room.owner == state.name) ...[
                        StartButton(
                          isLoading: false,
                          onPress: () => onStart(room.code),
                        ),
                      ],
                      const SizedBox(height: 30)
                    ],
                  ),
                ),
              ],
            );
          }
          if (state is MultiPlayerRoomDeleted) {
            return SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'Room no longer exists',
                      style: theme.textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  StartButton(
                    onPress: onBack,
                    isLoading: state is MultiPlayerLoading,
                    color: theme.primaryColor,
                    alternateText: 'Go Back',
                    alternateHeight: 65,
                    alternateTextStyle: theme.textTheme.headlineMedium,
                  ),
                ],
              ),
            );
          }
          return const Text('Error');
        },
      ),
    );
  }
}
