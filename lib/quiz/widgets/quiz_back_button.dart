import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';

class QuizBackButton extends StatelessWidget {
  const QuizBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: () {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text('Do you want to quit?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.router.replaceAll([const HomeRoute()]);
                    context.read<QuizBloc>().add(QuizSingleFinished());
                  },
                  child: const Text('Quit'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
