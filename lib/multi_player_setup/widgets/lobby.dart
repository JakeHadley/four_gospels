import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';

class Lobby extends StatelessWidget {
  const Lobby({
    super.key,
  });

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
                    GameInfo(code: room.code),
                    const PlayerList(),
                    ActionButton(
                      onTap: () => print('hello'),
                      color: theme.primaryColor,
                      text: 'Start Game',
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
