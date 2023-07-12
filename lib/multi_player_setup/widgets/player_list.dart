import 'package:flutter/material.dart';

class PlayerList extends StatelessWidget {
  const PlayerList({
    required this.users,
    super.key,
  });

  final List<String> users;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            // color: theme.cardColor,
            border: Border.all(color: Colors.grey, width: 3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(users[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
