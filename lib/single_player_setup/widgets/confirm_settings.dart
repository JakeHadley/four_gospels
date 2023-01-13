import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

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
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizLoadedSingle) {
          onStateChange(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Ready to test your knowlege?',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              const SizedBox(height: 54),
              InfoBox(mode: mode, numberQuestions: numberQuestions),
              const Spacer(),
              StartButton(
                onPress: onPress,
                isInitialState: state is QuizInitial,
              ),
              const SizedBox(height: 38)
            ],
          ),
        );
      },
    );
  }
}
