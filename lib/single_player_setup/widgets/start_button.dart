import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
    required this.onPress,
  });

  final void Function(BuildContext context) onPress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => onPress(context),
          child: AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            duration: const Duration(milliseconds: 200),
            width: state is QuizInitial ? 300 : 100,
            height: state is QuizInitial ? 100 : 100,
            child: AnimatedSwitcher(
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              duration: const Duration(milliseconds: 200),
              child: state is QuizInitial
                  ? Text(
                      'Start',
                      style: Theme.of(context).textTheme.headline1,
                    )
                  : const CircularProgressIndicator(
                      color: Colors.white,
                    ),
            ),
          ),
        );
      },
    );
  }
}
