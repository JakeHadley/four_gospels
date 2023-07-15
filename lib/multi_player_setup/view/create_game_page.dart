import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:random_string/random_string.dart';

@RoutePage()
class CreateGamePage extends StatefulWidget {
  const CreateGamePage({super.key});

  @override
  State<CreateGamePage> createState() => _CreateGamePageState();
}

class _CreateGamePageState extends State<CreateGamePage> {
  final _nameController = TextEditingController();
  int _numPlayers = 3;
  int _numQuestions = 10;
  bool _nameEntered = false;
  Mode _mode = Mode.easy;

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

  void changePlayers(int value) {
    setState(() => _numPlayers = value);
  }

  void changeQuestions(int value) {
    setState(() => _numQuestions = value);
  }

  bool isValid() => _nameEntered;

  Widget choiceChipGenerator(
    int index,
    ThemeData theme,
    AppLocalizations l10n,
  ) {
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

  void onContinue() {
    if (!isValid()) {
      return;
    }

    final language = Localizations.localeOf(context);

    final createRoomEvent = MultiPlayerCreateRoom(
      code: randomAlphaNumeric(6),
      numPlayers: _numPlayers,
      numQuestions: _numQuestions,
      name: _nameController.text,
      mode: _mode,
      language: language.toLanguageTag(),
    );

    context.read<MultiPlayerBloc>().add(createRoomEvent);
  }

  void onStateChange() {
    _nameController.clear();

    setState(() {
      _nameEntered = false;
    });

    context.router.navigate(const LobbyRoute());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final chips = List.generate(
      3,
      (int index) => choiceChipGenerator(index, theme, l10n),
    );
    return Scaffold(
      appBar: CustomAppBar(title: l10n.createGameAppBar),
      body: GameCreation(
        changePlayers: changePlayers,
        changeQuestions: changeQuestions,
        controller: _nameController,
        isValid: isValid(),
        onContinue: onContinue,
        players: _numPlayers,
        questions: _numQuestions,
        chips: chips,
        onStateChange: onStateChange,
      ),
    );
  }
}
