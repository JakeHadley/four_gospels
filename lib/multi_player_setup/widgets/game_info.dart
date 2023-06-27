import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class GameInfo extends StatelessWidget {
  const GameInfo({
    required this.code,
    required this.numberOfPlayers,
    required this.numberOfQuestions,
    super.key,
  });

  final String code;
  final int numberOfPlayers;
  final int numberOfQuestions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Players',
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  '$numberOfPlayers',
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Questions',
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
                  'Mode',
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  'Easy',
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
              'Code: $code',
              style: theme.textTheme.headlineSmall,
            ),
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => Share.share('This is a share text'),
              color: theme.primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
