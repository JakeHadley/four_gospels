import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class GameInfo extends StatelessWidget {
  const GameInfo({
    required this.code,
    super.key,
  });

  final String code;

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
