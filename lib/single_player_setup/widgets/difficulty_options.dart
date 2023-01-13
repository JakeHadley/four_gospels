import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/quiz/models/mode.dart';

class DifficultyOptions extends StatelessWidget {
  const DifficultyOptions({super.key, required this.onPress});

  final void Function(BuildContext context, Mode mode) onPress;

  @override
  Widget build(BuildContext context) {
    final _icon = Icon(
      Icons.star,
      color: Theme.of(context).primaryIconTheme.color,
      size: 48,
    );

    void Function() _select(Mode mode) => () => onPress(context, mode);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select a Difficulty',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          OptionItem(
            text: 'Easy',
            action: _select(Mode.easy),
            color: Theme.of(context).primaryColorLight,
            iconWidget: _icon,
            darkText: true,
            equalWidth: true,
          ),
          const SizedBox(height: 26),
          OptionItem(
            text: 'Moderate',
            action: _select(Mode.moderate),
            color: Theme.of(context).colorScheme.secondaryContainer,
            iconWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_icon, _icon],
            ),
            darkText: true,
            equalWidth: true,
          ),
          const SizedBox(height: 26),
          OptionItem(
            text: 'Hard',
            action: _select(Mode.hard),
            color: Theme.of(context).colorScheme.tertiaryContainer,
            iconWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_icon, _icon, _icon],
            ),
            darkText: true,
            equalWidth: true,
          )
        ],
      ),
    );
  }
}
