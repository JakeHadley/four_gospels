import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

class Lobby extends StatelessWidget {
  const Lobby({
    required this.onStart,
    required this.onBack,
    super.key,
  });

  final void Function(String code) onStart;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<MultiPlayerBloc, MultiPlayerState>(
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
    );
  }
}
