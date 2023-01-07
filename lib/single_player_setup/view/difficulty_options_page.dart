import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

class DifficultyOptionsPage extends StatefulWidget {
  const DifficultyOptionsPage({super.key});

  @override
  State<DifficultyOptionsPage> createState() => _DifficultyOptionsPageState();
}

class _DifficultyOptionsPageState extends State<DifficultyOptionsPage> {
  // void onSinglePress() {
  //   context.router.push(const QuizRoute());
  //   context.read<QuizBloc>().add(
  //         QuizSinglePlayerStart(
  //           selectedQuestionItem!.num,
  //           selectedModeItem!.mode,
  //         ),
  //       );
  // }

  // bool validate() {
  //   return selectedQuestionItem != null && selectedModeItem != null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 75, title: 'Single Player'),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Subtitle(text: 'Select a Difficulty'),
            DifficultyOptions(),
          ],
        ),
      ),
    );
  }
}
