import 'package:flutter/material.dart';

class SinglePlayerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SinglePlayerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      title: Text(
        'Single Player',
        style: Theme.of(context)
            .textTheme
            .headline5!
            .merge(const TextStyle(color: Colors.white)),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
