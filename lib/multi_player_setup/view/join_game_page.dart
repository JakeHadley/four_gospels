import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';

@RoutePage()
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

  void onContinue() {
    if (!isValid()) {
      return;
    }

    final language = Localizations.localeOf(context);

    final joinRoomEvent = MultiPlayerJoinRoom(
      name: _nameController.text,
      code: _codeController.text,
      language: language.toLanguageTag(),
    );

    context.read<MultiPlayerBloc>().add(joinRoomEvent);
  }

  void onError(String error) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(error),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        )
        .closed
        .then((reason) {
      context.read<MultiPlayerBloc>().add(MultiPlayerReset());
    });
  }

  void onStateChange() {
    _codeController.clear();
    _nameController.clear();

    setState(() {
      _codeEntered = false;
      _nameEntered = false;
    });

    context.router.navigate(const LobbyRoute());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: CustomAppBar(title: l10n.joinGameAppBar),
      resizeToAvoidBottomInset: false,
      body: JoinGame(
        codeController: _codeController,
        nameController: _nameController,
        isValid: isValid(),
        onContinue: onContinue,
        onError: onError,
        onStateChange: onStateChange,
      ),
    );
  }
}
