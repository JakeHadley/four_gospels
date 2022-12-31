import 'package:flutter/material.dart';
import 'package:four_gospels/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const HomeAppBar(height: 150),
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text('New Testament Quiz'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // QuizzesMenu(),
            const SizedBox(height: 15),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Text(
                'Select a quiz',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            const SizedBox(height: 15),
            const GameOptions(),
          ],
        ),
      ),
    );
  }
}
