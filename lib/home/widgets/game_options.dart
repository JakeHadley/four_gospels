import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';

class GameOptions extends StatelessWidget {
  const GameOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                l10n.selectQuizSubtitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          OptionItem(
            text: l10n.singlePlayerHome,
            action: () => context.router.push(const DifficultyOptionsRoute()),
            color: Theme.of(context).primaryColorDark,
            iconWidget: const Icon(Icons.person, size: 80),
          ),
          const SizedBox(height: 20),
          OptionItem(
            text: l10n.multiPlayer,
            action: () => context.router.push(const MultiPlayerSetupRoute()),
            color: Theme.of(context).colorScheme.secondary,
            iconWidget: const Icon(Icons.groups, size: 80),
          ),
          const SizedBox(height: 20),
          OptionItem(
            text: l10n.speedRound,
            action: () => context.router.push(const SpeedSetupRoute()),
            color: Theme.of(context).colorScheme.tertiary,
            iconWidget: const Icon(Icons.av_timer, size: 80),
          )
        ],
      ),
    );
  }
}
