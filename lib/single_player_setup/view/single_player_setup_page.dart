import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/quiz/models/mode.dart';
import 'package:four_gospels/quiz/quiz.dart';
import 'package:four_gospels/single_player_setup/models.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

class SinglePlayerSetupPage extends StatefulWidget {
  const SinglePlayerSetupPage({super.key});

  @override
  State<SinglePlayerSetupPage> createState() => _SinglePlayerSetupPageState();
}

class _SinglePlayerSetupPageState extends State<SinglePlayerSetupPage> {
  QuestionItem? selectedQuestionItem;
  ModeItem? selectedModeItem;

  final List<DropdownMenuItem<QuestionItem>> questionItems = [
    const QuestionItem('10 Questions', 10),
    const QuestionItem('15 Questions', 15),
    const QuestionItem('20 Questions', 20),
    const QuestionItem('25 Questions', 25),
  ]
      .map(
        (item) => DropdownMenuItem<QuestionItem>(
          value: item,
          child: Text(
            item.text,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      )
      .toList();

  final List<DropdownMenuItem<ModeItem>> modeItems = [
    const ModeItem('Easy', Mode.easy),
    const ModeItem('Moderate', Mode.moderate),
    const ModeItem('Hard', Mode.hard),
  ]
      .map(
        (item) => DropdownMenuItem<ModeItem>(
          value: item,
          child: Text(
            item.text,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      )
      .toList();

  void onSinglePress() {
    context.router.push(const QuizRoute());
    context.read<QuizBloc>().add(
          QuizSinglePlayerStart(
            selectedQuestionItem!.num,
            selectedModeItem!.mode,
          ),
        );
  }

  bool validate() {
    return selectedQuestionItem != null && selectedModeItem != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SinglePlayerAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    '10 Points per correct answer',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  DropdownSelector<QuestionItem>(
                    text: 'Select number of questions',
                    items: questionItems,
                    value: selectedQuestionItem,
                    onChanged: (value) {
                      setState(() {
                        selectedQuestionItem = value;
                      });
                    },
                  ),
                  DropdownSelector<ModeItem>(
                    text: 'Select difficulty',
                    items: modeItems,
                    value: selectedModeItem,
                    onChanged: (value) {
                      setState(() {
                        selectedModeItem = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(148, 44),
                elevation: 5,
              ),
              onPressed: validate() ? onSinglePress : null,
              child: Text(
                'Begin',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .merge(const TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
