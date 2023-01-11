import 'package:flutter/material.dart';
import 'package:four_gospels/quiz/models/mode.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    super.key,
    required this.mode,
    required this.numberQuestions,
  });

  final Mode mode;
  final int numberQuestions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
