import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';

@RoutePage()
class MultiPlayerSetupPage extends StatelessWidget {
  const MultiPlayerSetupPage({super.key});

  void onCreate(BuildContext context) {
    context.router.push(const CreateGameRoute());
  }

  void onJoin(BuildContext context) {
    context.router.push(const JoinGameRoute());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: CustomAppBar(title: l10n.multiPlayerAppBar),
      body: MultiPlayerOptions(
        onCreate: () {
          onCreate(context);
        },
        onJoin: () {
          onJoin(context);
        },
      ),
    );
  }
}
