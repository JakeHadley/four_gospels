import 'package:flutter/material.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/models/mode.dart';
import 'package:four_gospels/single_player_setup/widgets/number_option.dart';

class NumberQuestionOptions extends StatelessWidget {
  const NumberQuestionOptions({
    required this.mode,
    required this.onPress,
    super.key,
  });

  final Mode mode;
  final void Function(BuildContext context, int num) onPress;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // TODO: Add more numbers of questions

    VoidCallback select(int n) => () => onPress(context, n);

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
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberOption(text: '10', action: select(10)),
              const SizedBox(width: 10),
              NumberOption(text: '15', action: select(15)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberOption(text: '20', action: select(20)),
              const SizedBox(width: 10),
              NumberOption(text: '25', action: select(25)),
            ],
          )
        ],
      ),
    );
  }
}
