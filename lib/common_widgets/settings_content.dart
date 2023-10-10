import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/models/models.dart';
import 'package:four_gospels/quiz/quiz.dart';
import 'package:numberpicker/numberpicker.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({
    required this.type,
    required this.onStateChange,
    required this.chips,
    required this.onChangeQuestions,
    required this.questions,
    required this.initialLanguage,
    required this.onChangeLanguage,
    required this.timer,
    required this.onChangeTimer,
    required this.isCompact,
    this.onPress,
    super.key,
  });

  final QuizType type;
  final void Function({int? timer}) onStateChange;
  final List<Widget> chips;
  final void Function(int value) onChangeQuestions;
  final int questions;
  final int initialLanguage;
  final void Function(int, CarouselPageChangedReason) onChangeLanguage;
  final int timer;
  final void Function(int value) onChangeTimer;
  final bool isCompact;
  final VoidCallback? onPress;

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
              if (type == QuizType.single || type == QuizType.multi) ...[
                Text(
                  l10n.numQuestions,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontSize: isCompact == true ? 18 : 25),
                ),
                NumberPicker(
                  axis: Axis.horizontal,
                  value: questions,
                  minValue: 10,
                  maxValue: 50,
                  onChanged: onChangeQuestions,
                  itemWidth: 60,
                  step: 5,
                ),
                Divider(
                  height: isCompact == true ? 10 : 30,
                  thickness: 1,
                  indent: 40,
                  endIndent: 40,
                  color: theme.disabledColor,
                ),
              ] else if (type == QuizType.speed) ...[
                Text(
                  l10n.timer,
                  style: theme.textTheme.bodyLarge?.copyWith(fontSize: 25),
                ),
                // TODO: add an arrow on both sides,
                //  indicating additional options
                NumberPicker(
                  axis: Axis.horizontal,
                  value: timer,
                  minValue: 15,
                  maxValue: 60,
                  onChanged: onChangeTimer,
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
                style: theme.textTheme.bodyLarge
                    ?.copyWith(fontSize: isCompact == true ? 18 : 25),
              ),
              SizedBox(height: isCompact == true ? 0 : 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: chips,
              ),
              Divider(
                height: isCompact == true ? 10 : 30,
                thickness: 1,
                indent: 40,
                endIndent: 40,
                color: theme.disabledColor,
              ),
              Text(
                l10n.quizLanguage,
                style: theme.textTheme.bodyLarge
                    ?.copyWith(fontSize: isCompact == true ? 18 : 25),
              ),
              const SizedBox(height: 10),
              // TODO: add a border for the selected item
              CarouselSlider(
                items: flags,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: isCompact == true ? 0.15 : 0.3,
                  height: isCompact == true ? 30 : 60,
                  initialPage: initialLanguage,
                  onPageChanged: onChangeLanguage,
                ),
              ),
              if (type != QuizType.multi) ...[
                const Spacer(),
                ActionButton(
                  onPress: onPress == null ? () {} : onPress!,
                  isLoading: state is QuizLoading,
                  color: theme.colorScheme.primaryContainer,
                  text: l10n.startButton,
                  height: 100,
                  textStyle: theme.textTheme.displayLarge,
                ),
              ],
              SizedBox(height: isCompact == true ? 0 : 30),
            ],
          ),
        );
      },
    );
  }
}
