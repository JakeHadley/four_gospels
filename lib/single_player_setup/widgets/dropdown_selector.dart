import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/single_player_setup/models.dart';

class DropdownSelector<T extends Item> extends StatelessWidget {
  const DropdownSelector({
    super.key,
    required this.text,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  final String text;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T? item)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      isExpanded: true,
      buttonHeight: 60,
      hint: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).hintColor,
        ),
      ),
      items: items,
      value: value,
      onChanged: onChanged,
    );
  }
}
