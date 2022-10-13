import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/app/auto_router.dart';

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
