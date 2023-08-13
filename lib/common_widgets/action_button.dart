import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.onPress,
    required this.isLoading,
    required this.color,
    required this.text,
    required this.height,
    required this.textStyle,
    super.key,
  });

  final VoidCallback onPress;
  final bool isLoading;
  final Color color;
  final String text;
  final double height;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final width = isLoading ? 100.0 : 315.0;

    return GestureDetector(
      onTap: isLoading ? () {} : onPress,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: color,
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
