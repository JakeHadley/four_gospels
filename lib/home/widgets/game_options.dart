import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';

class GameOptions extends StatelessWidget {
  const GameOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final _snackBar = SnackBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      content: const Text('Coming Soon!'),
      action: SnackBarAction(
        label: 'dismiss',
        textColor: Theme.of(context).colorScheme.tertiaryContainer,
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      ),
      behavior: SnackBarBehavior.floating,
    );

    void _dismissSnackbar() {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        OptionItem(
          text: 'Single Player',
          action: () => context.router.push(const DifficultyOptionsRoute()),
          color: Theme.of(context).primaryColorDark,
          iconWidget: const Icon(Icons.person, size: 80),
        ),
        const SizedBox(height: 26),
        OptionItem(
          text: 'MultiPlayer',
          action: _dismissSnackbar,
          // color: Theme.of(context).colorScheme.secondary,
          color: Colors.grey,
          iconWidget: const Icon(Icons.groups, size: 80),
        ),
        const SizedBox(height: 26),
        OptionItem(
          text: 'Speed Round',
          action: _dismissSnackbar,
          // color: Theme.of(context).colorScheme.tertiary,
          color: Colors.grey,
          iconWidget: const Icon(Icons.av_timer, size: 80),
        ),
      ],
    );
  }
}
