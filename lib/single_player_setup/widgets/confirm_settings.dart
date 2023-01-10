import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/quiz/models/models.dart';

class ConfirmSettings extends StatelessWidget {
  const ConfirmSettings({
    super.key,
    required this.mode,
    required this.numberQuestions,
    required this.onPress,
  });

  final Mode mode;
  final int numberQuestions;
  final void Function(BuildContext context) onPress;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          children: [
            const Subtitle(text: 'Ready to test your knowlege?'),
            const SizedBox(height: 54),
            SizedBox(
              child: Card(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Difficulty: ${mode.toString()}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Questions: $numberQuestions',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => onPress(context),
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.headline1,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 27, horizontal: 84),
                child: Text('Start'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
