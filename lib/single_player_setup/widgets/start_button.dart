import 'package:flutter/material.dart';
import 'package:four_gospels/l10n/l10n.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    required this.onPress,
    required this.isInitialState,
    super.key,
  });

  final void Function(BuildContext context) onPress;
  final bool isInitialState;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return GestureDetector(
      onTap: () => onPress(context),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        duration: const Duration(milliseconds: 200),
        width: isInitialState ? 300 : 100,
        height: isInitialState ? 100 : 100,
        child: AnimatedSwitcher(
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          duration: const Duration(milliseconds: 200),
          child: isInitialState
              ? Text(
                  l10n.startButton,
                  style: Theme.of(context).textTheme.displayLarge,
                )
              : const CircularProgressIndicator(
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
