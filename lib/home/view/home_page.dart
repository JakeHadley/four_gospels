import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/home/widgets/widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CustomAppBar(height: 75, title: l10n.homePageAppBarTitle),
      body: const GameOptions(),
    );
  }
}
