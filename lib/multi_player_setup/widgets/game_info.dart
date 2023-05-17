import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:share_plus/share_plus.dart';

final codeToShare = randomAlphaNumeric(6);

class GameInfo extends StatelessWidget {
  const GameInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Name: dave',
            style: theme.textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Number of Players: 3',
            style: theme.textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Number of Questions: 10',
            style: theme.textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Mode: Easy',
            style: theme.textTheme.headlineSmall,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Code: $codeToShare',
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
