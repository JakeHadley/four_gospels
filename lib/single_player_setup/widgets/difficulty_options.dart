import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/models/mode.dart';

class DifficultyOptions extends StatelessWidget {
  const DifficultyOptions({
    required this.onPress,
    super.key,
  });

  final void Function(BuildContext context, Mode mode) onPress;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // TODO: Add option for random difficulty

    final icon = Icon(
      Icons.star,
      color: Theme.of(context).primaryIconTheme.color,
      size: 44,
    );

    void Function() select(Mode mode) => () => onPress(context, mode);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                l10n.difficultySubtitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          OptionItem(
            text: l10n.difficultyEasy,
            action: select(Mode.easy),
            color: Theme.of(context).primaryColorLight,
            iconWidget: icon,
            darkText: true,
            equalWidth: true,
          ),
          const SizedBox(height: 26),
          OptionItem(
            text: l10n.difficultyModerate,
            action: select(Mode.moderate),
            color: Theme.of(context).colorScheme.secondaryContainer,
            iconWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon, icon],
            ),
            darkText: true,
            equalWidth: true,
          ),
          const SizedBox(height: 26),
          OptionItem(
            text: l10n.difficultyHard,
            action: select(Mode.hard),
            color: Theme.of(context).colorScheme.tertiaryContainer,
            iconWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon, icon, icon],
            ),
            darkText: true,
            equalWidth: true,
          )
        ],
      ),
    );
  }
}
