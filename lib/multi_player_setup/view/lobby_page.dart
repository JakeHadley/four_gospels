import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/multi_player_setup/widgets/lobby_back_button.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';

@RoutePage()
class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  void onStart(BuildContext context) {
    // TODO: get questions on start, add to firebase
  }

  void exitAction(BuildContext context) {
    context.read<MultiPlayerBloc>().add(MultiPlayerReset());
    context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.lobbyAppBar,
        backButton: LobbyBackButton(
          exitAction: () {
            exitAction(context);
          },
        ),
      ),
      body: Lobby(
        onStart: () {
          onStart(context);
        },
      ),
    );
  }
}
