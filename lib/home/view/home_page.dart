import 'package:flutter/material.dart';
import 'package:four_gospels/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomePageAppBar(height: 150),
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
