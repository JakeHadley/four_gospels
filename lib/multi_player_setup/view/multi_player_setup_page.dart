import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';

class MultiPlayerSetupPage extends StatelessWidget {
  const MultiPlayerSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: CustomAppBar(title: l10n.multiPlayerAppBar),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionButton(
                onTap: () => context.router.push(const JoinGameRoute()),
                color: Theme.of(context).primaryColor,
                text: l10n.joinGameButton,
              ),
              const SizedBox(height: 50),
              ActionButton(
                onTap: () => context.router.push(const CreateGameRoute()),
                color: Theme.of(context).primaryColor,
                text: l10n.createGameButton,
              )
            ],
          ),
        ],
      ),
    );
  }
}
