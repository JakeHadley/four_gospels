import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

class JoinGame extends StatelessWidget {
  const JoinGame({
    required this.codeController,
    required this.nameController,
    required this.isValid,
    required this.onContinue,
    required this.onError,
    required this.onStateChange,
    super.key,
  });

  final TextEditingController codeController;
  final TextEditingController nameController;
  final bool isValid;
  final VoidCallback onContinue;
  final void Function(String error) onError;
  final VoidCallback onStateChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = isValid ? theme.primaryColor : theme.disabledColor;
    final l10n = context.l10n;

    return BlocConsumer<MultiPlayerBloc, MultiPlayerState>(
      listener: (context, state) {
        if (state is MultiPlayerActive) {
          onStateChange();
        } else if (state is MultiPlayerError) {
          onError(state.error);
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Input(
                    controller: nameController,
                    label: l10n.enterNameField,
                  ),
                  Input(
                    controller: codeController,
                    label: l10n.enterCodeField,
                  ),
                  const SizedBox(height: 30),
                  const Spacer(),
                  StartButton(
                    onPress: onContinue,
                    isLoading: state is MultiPlayerLoading,
                    color: buttonColor,
                    alternateText: l10n.joinButton,
                    alternateHeight: 65,
                    alternateTextStyle: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
