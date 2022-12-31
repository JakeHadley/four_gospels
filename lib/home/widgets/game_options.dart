import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';

class GameOptions extends StatelessWidget {
  const GameOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final _snackBar = SnackBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      content: const Text('Coming Soon!'),
      action: SnackBarAction(
        label: 'dismiss',
        textColor: Theme.of(context).colorScheme.tertiaryContainer,
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      ),
      behavior: SnackBarBehavior.floating,
    );

    void _dismissSnackbar() {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
    }

    final _data = <Map<String, dynamic>>[
      {
        'text': 'Single Player',
        'action': () => context.router.push(const SinglePlayerSetupRoute()),
        'color': Theme.of(context).primaryColorDark,
        'icon': Icons.person,
      },
      {
        'text': 'MultiPlayer',
        'action': _dismissSnackbar,
        'color': Colors.grey,
        // 'color': Theme.of(context).colorScheme.secondary,
        'icon': Icons.groups,
      },
      {
        'text': 'Speed Round',
        'action': _dismissSnackbar,
        'color': Colors.grey,
        // 'color': Theme.of(context).colorScheme.tertiary,
        'icon': Icons.av_timer,
      }
    ];

    final _border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    );

    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 26),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 100,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Card(
              shape: _border,
              color: _data[index]['color'] as Color,
              child: InkWell(
                customBorder: _border,
                onTap: _data[index]['action'] as void Function()?,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(_data[index]['icon'] as IconData, size: 80),
                    Expanded(
                      child: Text(
                        _data[index]['text'] as String,
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 30)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
