import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';

class JoinGamePage extends StatelessWidget {
  const JoinGamePage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final buttonColor = theme.primaryColor;

    return Scaffold(
      appBar: CustomAppBar(title: l10n.joinGameAppBar),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: $name', style: theme.textTheme.bodyLarge),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Enter Code',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ActionButton(
                  onTap: () => print('hello'),
                  color: buttonColor,
                  text: 'Join',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
