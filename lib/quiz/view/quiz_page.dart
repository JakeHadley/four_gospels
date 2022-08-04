import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizLoading) {
          return Scaffold(
            appBar: AppBar(),
            body: const Text('loading'),
          );
        }
        if (state is QuizLoadedSingle) {
          return Scaffold(
            appBar: AppBar(),
            body: Text('loaded ${state.numberOfQuestions}'),
          );
        }
        return const Text('Error');
      },
    );
  }
}
