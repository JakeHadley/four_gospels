import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

class Lobby extends StatelessWidget {
  const Lobby({
    required this.onStart,
    super.key,
  });

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
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
                    const PlayerList(),
                    StartButton(
                      isLoading: false,
                      onPress: onStart,
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
            ],
          );
        }
        return const Text('Error');
      },
    );
  }
}
