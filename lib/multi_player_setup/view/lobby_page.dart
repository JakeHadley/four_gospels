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

    // TODO: intercept back button behavior to add an event to multiplayer bloc
    //  cleanup the subscription and set state back to initial

    return Scaffold(
      appBar: CustomAppBar(title: l10n.lobbyAppBar),
      body: const Lobby(),
    );
  }
}
