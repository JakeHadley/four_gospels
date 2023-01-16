import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/widgets/widgets.dart';

class EndGameContent extends StatelessWidget {
  const EndGameContent({
    super.key,
    required this.onPress,
  });

  final void Function(BuildContext) onPress;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizEnded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      l10n.endGamePageSubtitle,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
                const SizedBox(height: 54),
                InfoBox(
                  text1: '${l10n.endGameInfoScore}: ${state.numberOfPoints}',
                  text2: '${l10n.endGamePageCorrectAnswers}: '
                      '${state.numberCorrect.toInt()}/${state.numberOfQuestions}',
                ),
                const Spacer(),
                EndGameButton(onPress: onPress),
                const SizedBox(height: 20)
              ],
            ),
          );
        }
        return const Text('Error');
      },
    );
  }
}
