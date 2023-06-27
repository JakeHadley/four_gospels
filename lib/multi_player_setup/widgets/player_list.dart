import 'package:flutter/material.dart';

class PlayerList extends StatelessWidget {
  const PlayerList({
    super.key,
  });

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
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Player ${index + 1}'),
              );
            },
          ),
        ),
      ),
    );
  }
}
