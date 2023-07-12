import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  Input(
                    controller: nameController,
                    label: 'Enter Your Name',
                  ),
                  Input(
                    controller: codeController,
                    label: 'Enter Code',
                  ),
                  const SizedBox(height: 30),
                  StartButton(
                    onPress: onContinue,
                    isLoading: state is MultiPlayerLoading,
                    color: buttonColor,
                    alternateText: 'Join',
                    alternateHeight: 65,
                    alternateTextStyle: theme.textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
