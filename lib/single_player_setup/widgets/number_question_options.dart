import 'package:flutter/material.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/models/mode.dart';
import 'package:four_gospels/single_player_setup/widgets/number_option.dart';

class NumberQuestionOptions extends StatelessWidget {
  const NumberQuestionOptions({
    super.key,
    required this.mode,
    required this.onPress,
  });

  final Mode mode;
  final void Function(BuildContext context, int num) onPress;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    void Function() _select(int n) => () => onPress(context, n);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                l10n.numberQuestionsSubtitle,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberOption(text: '10', action: _select(10)),
              const SizedBox(width: 15),
              NumberOption(text: '15', action: _select(15)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberOption(text: '20', action: _select(20)),
              const SizedBox(width: 15),
              NumberOption(text: '25', action: _select(25)),
            ],
          )
        ],
      ),
    );
  }
}
