import 'package:flutter/material.dart';
import 'package:four_gospels/l10n/l10n.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    required this.onPress,
    required this.isLoading,
    super.key,
  });

  final void Function(BuildContext context) onPress;
  final bool isLoading;

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
        width: isLoading ? 100 : 300,
        height: isLoading ? 100 : 100,
        child: AnimatedSwitcher(
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          duration: const Duration(milliseconds: 200),
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  l10n.startButton,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
        ),
      ),
    );
  }
}
