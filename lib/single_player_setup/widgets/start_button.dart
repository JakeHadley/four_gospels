import 'package:flutter/material.dart';
import 'package:four_gospels/l10n/l10n.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    required this.onPress,
    required this.isLoading,
    this.color,
    this.alternateText,
    this.alternateHeight,
    this.alternateTextStyle,
    super.key,
  });

  final VoidCallback onPress;
  final bool isLoading;
  final Color? color;
  final String? alternateText;
  final double? alternateHeight;
  final TextStyle? alternateTextStyle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final buttonColor = color ?? Theme.of(context).colorScheme.primaryContainer;
    final width = isLoading ? 100.0 : 315.0;
    final height = alternateHeight ?? 100;
    final text = alternateText ?? l10n.startButton;
    final textStyle =
        alternateTextStyle ?? Theme.of(context).textTheme.displayLarge;

    return GestureDetector(
      onTap: isLoading ? () {} : onPress,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: buttonColor,
        ),
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height,
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
              : Text(text, style: textStyle),
        ),
      ),
    );
  }
}
