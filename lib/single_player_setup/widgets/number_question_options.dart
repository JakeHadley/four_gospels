import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
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
    void Function() _select(int n) => () => onPress(context, n);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Subtitle(text: 'Select how many questions'),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberOption(text: '10', action: _select(10)),
                      NumberOption(text: '15', action: _select(15)),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberOption(text: '20', action: _select(20)),
                      NumberOption(text: '25', action: _select(25)),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
