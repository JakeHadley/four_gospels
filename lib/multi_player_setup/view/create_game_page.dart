import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:random_string/random_string.dart';

class CreateGamePage extends StatelessWidget {
  const CreateGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final codeToShare = randomAlphaNumeric(6);

    return Scaffold(
      appBar: CustomAppBar(title: l10n.createGameAppBar),
      body: Column(
        children: [
          Text(codeToShare),
        ],
      ),
    );
  }
}
