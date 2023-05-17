import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';

@RoutePage()
class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final buttonColor = theme.primaryColor;

    return Scaffold(
      appBar: CustomAppBar(title: l10n.lobbyAppBar),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GameInfo(),
                const PlayerList(),
                ActionButton(
                  onTap: () => print('hello'),
                  color: buttonColor,
                  text: 'Start Game',
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
