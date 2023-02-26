import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/quiz.dart';

class BackButtonDialog extends StatelessWidget {
  const BackButtonDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AlertDialog(
      content: Text(l10n.quitDialogCaption),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.quitDialogCancel),
        ),
        ElevatedButton(
          onPressed: () {
            context.router.replaceAll([const HomeRoute()]);
            context.read<QuizBloc>().add(QuizSingleFinished());
          },
          child: Text(l10n.quitDialogQuit),
        ),
      ],
    );
  }
}
