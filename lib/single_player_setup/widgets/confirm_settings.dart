import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/single_player_setup/widgets/info_box.dart';
import 'package:four_gospels/single_player_setup/widgets/start_button.dart';

class ConfirmSettings extends StatelessWidget {
  const ConfirmSettings({
    super.key,
    required this.mode,
    required this.numberQuestions,
    required this.onPress,
    required this.onStateChange,
  });

  final Mode mode;
  final int numberQuestions;
  final void Function(BuildContext context) onPress;
  final void Function(BuildContext context) onStateChange;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          children: [
            const Subtitle(text: 'Ready to test your knowlege?'),
            const SizedBox(height: 54),
            InfoBox(mode: mode, numberQuestions: numberQuestions),
            const Spacer(),
            StartButton(onPress: onPress)
          ],
        ),
      ),
    );
  }
}
