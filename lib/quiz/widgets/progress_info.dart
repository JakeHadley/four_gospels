import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/models/models.dart';

class ProgressInfo extends StatelessWidget {
  const ProgressInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizLoaded && state.type == QuizType.single) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${l10n.quizSubtitleQuestion} '
                '${state.currentQuestionIndex + 1} '
                '${l10n.quizSubtitleOf} ${state.numberOfQuestions}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  value: (state.currentQuestionIndex + 1) /
                      state.numberOfQuestions,
                  color: Theme.of(context).primaryColorDark,
                  backgroundColor: Theme.of(context).primaryColorLight,
                ),
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
