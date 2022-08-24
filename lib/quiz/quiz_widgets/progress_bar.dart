import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.currentQuestionIndex,
    required this.numberOfQuestions,
    required this.numberOfPoints,
  });

  final int currentQuestionIndex;
  final int numberOfQuestions;
  final int numberOfPoints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Question '
                '${currentQuestionIndex + 1}/'
                '$numberOfQuestions',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '$numberOfPoints Points',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 10),
          FAProgressBar(
            currentValue: currentQuestionIndex.toDouble() + 1,
            maxValue: numberOfQuestions.toDouble(),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            size: 16,
            progressColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Theme.of(context).colorScheme.onError,
          ),
        ],
      ),
    );
  }
}
