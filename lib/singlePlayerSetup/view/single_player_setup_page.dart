import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/quiz/quiz.dart';

class SinglePlayerSetupPage extends StatefulWidget {
  const SinglePlayerSetupPage({super.key});

  @override
  State<SinglePlayerSetupPage> createState() => _SinglePlayerSetupPageState();
}

class _SinglePlayerSetupPageState extends State<SinglePlayerSetupPage> {
  QuestionItem? selectedValue;
  final List<QuestionItem> items = [
    QuestionItem('10 Questions', 10),
    QuestionItem('15 Questions', 15),
    QuestionItem('20 Questions', 20),
    QuestionItem('25 Questions', 25),
  ];

  void onSinglePress() {
    context.router.push(const QuizRoute());
    context.read<QuizBloc>().add(QuizSinglePlayerStart(selectedValue!.num));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          'Single Player',
          style: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: const Color(0xff56b2de),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '10 Points per correct answer',
                style: Theme.of(context).textTheme.headline5,
              ),
              DropdownButton2(
                isExpanded: true,
                buttonHeight: 60,
                hint: Text(
                  'Select Number of Questions',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
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
                    .toList(),
                value: selectedValue,
                onChanged: (QuestionItem? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: selectedValue != null ? onSinglePress : null,
                child: const Text('Begin'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionItem {
  QuestionItem(this.text, this.num);

  final String text;
  final int num;
}
