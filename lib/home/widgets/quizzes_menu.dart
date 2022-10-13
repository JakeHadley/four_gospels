import 'package:flutter/material.dart';

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
