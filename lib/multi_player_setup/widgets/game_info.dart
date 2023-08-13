import 'package:flutter/material.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:share_plus/share_plus.dart';

class GameInfo extends StatelessWidget {
  const GameInfo({
    required this.code,
    required this.numberOfQuestions,
    required this.mode,
    super.key,
  });

  final String code;
  final int numberOfQuestions;
  final Mode mode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  l10n.confirmSettingsNumberQuestions,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  '$numberOfQuestions',
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  l10n.confirmSettingsDifficulty,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  mode.toStringIntl(l10n),
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${l10n.code}: $code',
              style: theme.textTheme.headlineSmall,
            ),
            IconButton(
              // TODO: Come back to this and check what happens on share
              icon: const Icon(Icons.share),
              onPressed: () => Share.share('${l10n.share}: $code'),
              color: theme.primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
