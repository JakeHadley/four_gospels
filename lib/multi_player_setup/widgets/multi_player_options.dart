import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';

class MultiPlayerOptions extends StatelessWidget {
  const MultiPlayerOptions({
    required this.onCreate,
    required this.onJoin,
    super.key,
  });

  final VoidCallback onCreate;
  final VoidCallback onJoin;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final buttonColor = theme.primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              ActionButton(
                onTap: onCreate,
                color: buttonColor,
                text: l10n.createGameButton,
              ),
              const SizedBox(height: 50),
              ActionButton(
                onTap: onJoin,
                color: buttonColor,
                text: l10n.joinGameButton,
              ),
            ],
          ),
        )
      ],
    );
  }
}
