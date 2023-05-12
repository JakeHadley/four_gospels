import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:numberpicker/numberpicker.dart';

class CreateGamePage extends StatefulWidget {
  const CreateGamePage({super.key});

  @override
  State<CreateGamePage> createState() => _CreateGamePageState();
}

class _CreateGamePageState extends State<CreateGamePage> {
  int _numPlayers = 3;
  int _numQuestions = 10;
  Mode _mode = Mode.easy;
  final _nameController = TextEditingController();
  bool _nameEntered = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _nameController.addListener(() {
      setState(() {
        _nameEntered = _nameController.text.isNotEmpty;
      });
    });
    super.initState();
  }

  Widget generator(int index, ThemeData theme, AppLocalizations l10n) {
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
  }

  bool isValid() {
    return _nameEntered;
  }

  void enterLobby(BuildContext context) {
    if (!isValid()) {
      return;
    }

    context.router.push(const LobbyRoute());
    _nameController.clear();
    setState(() {
      _nameEntered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final buttonColor = isValid() ? theme.primaryColor : theme.disabledColor;

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
                Input(
                  controller: _nameController,
                  label: 'Enter Your Name',
                ),
                const SizedBox(height: 10),
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
                    (int index) => generator(index, theme, l10n),
                  ),
                ),
                const Spacer(),
                ActionButton(
                  onTap: () => enterLobby(context),
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
