import 'package:flutter/material.dart';

class QuizAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QuizAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        'Single Player',
        style: Theme.of(context)
            .textTheme
            .headline5!
            .merge(const TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
