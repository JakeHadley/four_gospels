import 'package:flutter/material.dart';

class EndGameButton extends StatelessWidget {
  const EndGameButton({super.key, required this.onPress});

  final void Function(BuildContext p1) onPress;

  @override
  Widget build(BuildContext context) {
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
            'Play Again?',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
