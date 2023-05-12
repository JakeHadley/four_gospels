import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';

import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';

class JoinGamePage extends StatefulWidget {
  const JoinGamePage({super.key, required this.name});

  final String name;

  @override
  State<JoinGamePage> createState() => _JoinGamePageState();
}

class _JoinGamePageState extends State<JoinGamePage> {
  final _controller = TextEditingController();
  bool _codeEntered = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _codeEntered = _controller.text.isNotEmpty;
      });
    });
    super.initState();
  }

  void enterGame(BuildContext context, PageRouteInfo? route) {
    if (route == null) {
      return;
    }

    context.router.push(route);
    _controller.clear();
    setState(() {
      _codeEntered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final buttonColor = _codeEntered ? theme.primaryColor : theme.disabledColor;

    return Scaffold(
      appBar: CustomAppBar(title: l10n.joinGameAppBar),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Name: ${widget.name}',
                  style: theme.textTheme.headlineSmall,
                ),
                Input(
                  label: 'Enter Code',
                  controller: _controller,
                ),
                const SizedBox(height: 30),
                ActionButton(
                  onTap: () => enterGame(
                    context,
                    _codeEntered ? const LobbyRoute() : null,
                  ),
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
