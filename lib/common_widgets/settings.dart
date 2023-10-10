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
    required this.isCompact,
    this.onPress,
    this.onChangeSettings,
    super.key,
  });

  // TODO: verify that settings are reset correctly

  final QuizType type;
  final void Function({int? timer}) onStateChange;
  final bool isCompact;
  final void Function({
    required Mode mode,
    required String language,
    int? questions,
    int? timer,
  })? onPress;
  final void Function(
    SettingsOptions option,
    dynamic value,
  )? onChangeSettings;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _questions = 10;
  Mode _mode = Mode.easy;
  String _language = Languages.en.name;
  int _timer = 15;

  void _onChangeQuestions(int value) {
    setState(() => _questions = value);
    widget.onChangeSettings?.call(SettingsOptions.questions, value);
  }

  void _onTimerChanged(int value) {
    setState(() => _timer = value);
  }

  Widget _choiceChipGenerator(
    int index,
    ThemeData theme,
    AppLocalizations l10n,
  ) {
    final mode = Mode.values[index];

    // TODO: make chips wrap
    // https://stackoverflow.com/a/58547609/7514409
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        selectedColor: theme.primaryColorLight,
        label: Text(
          mode.toStringIntl(l10n),
          style: theme.textTheme.bodyLarge
              ?.copyWith(fontSize: widget.isCompact ? 16 : 20),
        ),
        selected: _mode == mode,
        onSelected: (bool selected) {
          setState(() => _mode = mode);
          widget.onChangeSettings?.call(SettingsOptions.difficulty, mode);
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
    widget.onChangeSettings?.call(
      SettingsOptions.language,
      Languages.values[index].name,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    final chips = List.generate(
      Mode.values.length,
      (int index) => _choiceChipGenerator(index, theme, l10n),
    );

    return SettingsContent(
      type: widget.type,
      chips: chips,
      onStateChange: widget.onStateChange,
      onChangeQuestions: _onChangeQuestions,
      questions: _questions,
      initialLanguage: getFlagFromLanguage(),
      onChangeLanguage: getLanguageFromFlag,
      timer: _timer,
      onChangeTimer: _onTimerChanged,
      onPress: () => widget.onPress?.call(
        mode: _mode,
        language: _language,
        questions: _questions,
        timer: _timer,
      ),
      isCompact: widget.isCompact,
    );
  }
}
