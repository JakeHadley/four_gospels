import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/quiz/models/mode.dart';

class DifficultyOptions extends StatelessWidget {
  const DifficultyOptions({super.key});

  void _onPress(BuildContext context, Mode mode) {
    context.router.push(NumberQuestionsRoute(mode: mode));
  }

  @override
  Widget build(BuildContext context) {
    final _icon = Icon(
      Icons.star,
      color: Theme.of(context).primaryIconTheme.color,
      size: 54,
    );

    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        OptionItem(
          text: 'Easy',
          action: () => _onPress(context, Mode.easy),
          color: Theme.of(context).primaryColorLight,
          iconWidget: _icon,
          darkText: true,
          equalWidth: true,
        ),
        const SizedBox(height: 26),
        OptionItem(
          text: 'Moderate',
          action: () => _onPress(context, Mode.moderate),
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
          action: () => _onPress(context, Mode.hard),
          color: Theme.of(context).colorScheme.tertiaryContainer,
          iconWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_icon, _icon, _icon],
          ),
          darkText: true,
          equalWidth: true,
        ),
      ],
    );
  }
}
