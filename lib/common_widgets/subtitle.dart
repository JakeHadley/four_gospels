import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({super.key, required String text}) : _text = text;

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        FractionallySizedBox(
          widthFactor: 0.9,
          child: Text(
            _text,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
