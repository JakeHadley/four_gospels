import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';

import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';

class JoinGamePage extends StatefulWidget {
  const JoinGamePage({super.key});

  @override
  State<JoinGamePage> createState() => _JoinGamePageState();
}

class _JoinGamePageState extends State<JoinGamePage> {
  final _codeController = TextEditingController();
  final _nameController = TextEditingController();
  bool _codeEntered = false;
  bool _nameEntered = false;

  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _codeController.addListener(() {
      setState(() {
        _codeEntered = _codeController.text.isNotEmpty;
      });
    });
    _nameController.addListener(() {
      setState(() {
        _nameEntered = _nameController.text.isNotEmpty;
      });
    });
    super.initState();
  }

  bool isValid() {
    return _codeEntered && _nameEntered;
  }

  void enterLobby(BuildContext context) {
    if (!isValid()) {
      return;
    }

    context.router.push(const LobbyRoute());
    _codeController.clear();
    _nameController.clear();
    setState(() {
      _codeEntered = false;
      _nameEntered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final buttonColor = isValid() ? theme.primaryColor : theme.disabledColor;

    return Scaffold(
      appBar: CustomAppBar(title: l10n.joinGameAppBar),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Input(
                  controller: _nameController,
                  label: 'Enter Your Name',
                ),
                Input(
                  controller: _codeController,
                  label: 'Enter Code',
                ),
                const SizedBox(height: 30),
                ActionButton(
                  onTap: () => enterLobby(context),
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
