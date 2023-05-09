import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';

class MultiPlayerSetupPage extends StatefulWidget {
  const MultiPlayerSetupPage({super.key});

  @override
  State<MultiPlayerSetupPage> createState() => _MultiPlayerSetupPageState();
}

class _MultiPlayerSetupPageState extends State<MultiPlayerSetupPage> {
  final _controller = TextEditingController();
  var _nameEntered = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _nameEntered = _controller.text.isNotEmpty;
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
      _nameEntered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final buttonColor = _nameEntered ? theme.primaryColor : theme.disabledColor;

    return Scaffold(
      appBar: CustomAppBar(title: l10n.multiPlayerAppBar),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Enter Your Name',
                    ),
                    controller: _controller,
                  ),
                ),
                const SizedBox(height: 30),
                ActionButton(
                  onTap: () => enterGame(
                    context,
                    _nameEntered
                        ? CreateGameRoute(name: _controller.text)
                        : null,
                  ),
                  color: buttonColor,
                  text: l10n.createGameButton,
                ),
                const SizedBox(height: 50),
                ActionButton(
                  onTap: () => enterGame(
                    context,
                    _nameEntered ? JoinGameRoute(name: _controller.text) : null,
                  ),
                  color: buttonColor,
                  text: l10n.joinGameButton,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
