import 'package:carousel_slider/carousel_slider.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/quiz.dart';
import 'package:numberpicker/numberpicker.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({
    required this.type,
    required this.onStateChange,
    required this.chips,
    required this.changeQuestions,
    required this.questions,
    required this.initialLanguage,
    required this.onLanguageChanged,
    required this.timer,
    required this.onTimerChanged,
    required this.onPress,
    super.key,
  });

  final QuizType type;
  final void Function({int? timer}) onStateChange;
  final List<Widget> chips;
  final void Function(int value) changeQuestions;
  final int questions;
  final int initialLanguage;
  final void Function(int, CarouselPageChangedReason) onLanguageChanged;
  final int timer;
  final void Function(int value) onTimerChanged;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizLoaded) {
          if (state.type == QuizType.speed) {
            onStateChange(timer: state.timer);
          } else {
            onStateChange();
          }
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              if (type == QuizType.single) ...[
                Text(
                  l10n.numQuestions,
                  style: theme.textTheme.bodyLarge?.copyWith(fontSize: 25),
                ),
                NumberPicker(
                  axis: Axis.horizontal,
                  value: questions,
                  minValue: 10,
                  maxValue: 50,
                  onChanged: changeQuestions,
                  itemWidth: 60,
                  step: 5,
                ),
                Divider(
                  height: 30,
                  thickness: 1,
                  indent: 40,
                  endIndent: 40,
                  color: theme.disabledColor,
                ),
              ] else if (type == QuizType.speed) ...[
                //TODO: Translate
                Text(
                  'Timer Amount',
                  style: theme.textTheme.bodyLarge?.copyWith(fontSize: 25),
                ),
                NumberPicker(
                  axis: Axis.horizontal,
                  value: timer,
                  minValue: 15,
                  maxValue: 60,
                  onChanged: onTimerChanged,
                  itemWidth: 60,
                  step: 15,
                ),
                Divider(
                  height: 30,
                  thickness: 1,
                  indent: 40,
                  endIndent: 40,
                  color: theme.disabledColor,
                ),
              ],
              Text(
                l10n.confirmSettingsDifficulty,
                style: theme.textTheme.bodyLarge?.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: chips,
              ),
              Divider(
                height: 30,
                thickness: 1,
                indent: 40,
                endIndent: 40,
                color: theme.disabledColor,
              ),
              Text(
                l10n.quizLanguage,
                style: theme.textTheme.bodyLarge?.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 10),
              CarouselSlider(
                items: [
                  Flag.fromCode(FlagsCode.US),
                  Flag.fromCode(FlagsCode.BR),
                  Flag.fromCode(FlagsCode.ES),
                ],
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: 0.3,
                  height: 60,
                  initialPage: initialLanguage,
                  onPageChanged: onLanguageChanged,
                ),
              ),
              const Spacer(),
              ActionButton(
                onPress: onPress,
                isLoading: state is QuizLoading,
                color: theme.colorScheme.primaryContainer,
                text: l10n.startButton,
                height: 100,
                textStyle: theme.textTheme.displayLarge,
              ),
              const SizedBox(height: 30)
            ],
          ),
        );
      },
    );
  }
}
