import 'package:flutter/material.dart';

class NumberOption extends StatelessWidget {
  const NumberOption({super.key, required this.text, required this.action});

  final String text;
  final void Function()? action;

  @override
  Widget build(BuildContext context) {
    final _border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    );

    return SizedBox(
      width: 150,
      height: 150,
      child: Card(
        shape: _border,
        elevation: 4,
        color: Theme.of(context).cardColor,
        child: InkWell(
          splashColor: Theme.of(context).primaryColorLight,
          onTap: action,
          customBorder: _border,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ),
    );
  }
}
