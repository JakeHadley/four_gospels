import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:random_string/random_string.dart';
import 'package:share_plus/share_plus.dart';

class CreateGamePage extends StatefulWidget {
  const CreateGamePage({super.key, required this.name});

  final String name;

  @override
  State<CreateGamePage> createState() => _CreateGamePageState();
}

final codeToShare = randomAlphaNumeric(6);

class _CreateGamePageState extends State<CreateGamePage> {
  int _numPlayers = 3;
  int _numQuestions = 10;
  Mode _mode = Mode.easy;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final buttonColor = theme.primaryColor;

    return Scaffold(
      appBar: CustomAppBar(title: l10n.createGameAppBar),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Text('Name: ${widget.name}', style: theme.textTheme.bodyLarge),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(codeToShare, style: theme.textTheme.bodyLarge),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () => Share.share('This is a share text'),
                      color: theme.primaryColor,
                    ),
                  ],
                ),
                Text('Number of Players', style: theme.textTheme.bodyLarge),
                NumberPicker(
                  axis: Axis.horizontal,
                  value: _numPlayers,
                  minValue: 2,
                  maxValue: 6,
                  onChanged: (value) => setState(() => _numPlayers = value),
                  itemWidth: 50,
                ),
                Text('Number of Questions', style: theme.textTheme.bodyLarge),
                NumberPicker(
                  axis: Axis.horizontal,
                  value: _numQuestions,
                  minValue: 10,
                  maxValue: 30,
                  onChanged: (value) => setState(() => _numQuestions = value),
                  itemWidth: 50,
                  step: 5,
                ),
                Text('Mode', style: theme.textTheme.bodyLarge),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (int index) {
                      final mode = Mode.values[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ChoiceChip(
                          selectedColor: theme.primaryColorLight,
                          label: Text(
                            mode.toStringIntl(l10n),
                            style: theme.textTheme.bodyLarge,
                          ),
                          selected: _mode == mode,
                          onSelected: (bool selected) {
                            setState(() {
                              _mode = mode;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                ActionButton(
                  onTap: () => print('hello'),
                  color: buttonColor,
                  text: 'Start',
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
