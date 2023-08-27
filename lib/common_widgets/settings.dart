import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/settings_content.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/models/models.dart';
import 'package:four_gospels/quiz/quiz.dart';

class Settings extends StatefulWidget {
  const Settings({
    required this.type,
    required this.onStateChange,
    required this.onPress,
    super.key,
  });

  final QuizType type;
  final void Function({int? timer}) onStateChange;
  final void Function({
    required Mode mode,
    required String language,
    int? questions,
    int? timer,
  }) onPress;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _questions = 10;
  Mode _mode = Mode.easy;
  String _language = Languages.en.name;
  int _timer = 15;

  void changeQuestions(int value) {
    setState(() => _questions = value);
  }

  void onTimerChanged(int value) {
    setState(() => _timer = value);
  }

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
          setState(() => _mode = mode);
        },
      ),
    );
  }

  int getFlagFromLanguage() {
    final language = Localizations.localeOf(context).toLanguageTag();

    return Languages.values.byName(language).index;
  }

  void getLanguageFromFlag(int index, CarouselPageChangedReason _) {
    setState(() {
      _language = Languages.values[index].name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    final chips = List.generate(
      3,
      (int index) => choiceChipGenerator(index, theme, l10n),
    );

    return SettingsContent(
      type: widget.type,
      chips: chips,
      onStateChange: widget.onStateChange,
      changeQuestions: changeQuestions,
      questions: _questions,
      initialLanguage: getFlagFromLanguage(),
      onLanguageChanged: getLanguageFromFlag,
      timer: _timer,
      onTimerChanged: onTimerChanged,
      onPress: () => widget.onPress(
        mode: _mode,
        language: _language,
        questions: _questions,
        timer: _timer,
      ),
    );
  }
}
