import 'package:flutter/material.dart';
import 'package:four_gospels/l10n/l10n.dart';

class EndGameButton extends StatelessWidget {
  const EndGameButton({
    required this.onPress,
    super.key,
  });

  final void Function(BuildContext p1) onPress;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // TODO: Standardize button widgets

    return InkWell(
      onTap: () => onPress(context),
      borderRadius: BorderRadius.circular(40),
      child: Ink(
        width: 315,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            l10n.endGameButton,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
