import 'package:flutter/material.dart';
import 'package:four_gospels/common_widgets/common_widgets.dart';
import 'package:four_gospels/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 75, title: 'New Testament Quiz'),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Subtitle(text: 'Select a Quiz'),
            GameOptions(),
          ],
        ),
      ),
    );
  }
}
