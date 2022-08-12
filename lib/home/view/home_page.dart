import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 150),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            QuizzesMenu(),
            GameOptions(),
          ],
        ),
      ),
    );
  }
}

class QuizzesMenu extends StatelessWidget {
  const QuizzesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quizzes',
            style: Theme.of(context).textTheme.headline5,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'View All',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}

class GameOptions extends StatelessWidget {
  const GameOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final data = <Map<String, dynamic>>[
      {
        'text': 'Single Player',
        'action': () => context.router.push(const SinglePlayerSetupRoute())
      },
      {'text': 'MultiPlayer'},
      {'text': 'Speed Round'}
    ];
    return SizedBox(
      height: 128,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              width: 128,
              child: Card(
                elevation: 5,
                child: InkWell(
                  onTap: data[index]['action'] as void Function()?,
                  child: Center(
                    child: Text(data[index]['text'] as String),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.primary
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SizedBox(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
