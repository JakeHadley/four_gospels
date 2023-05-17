import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.backButton,
  });

  final String title;
  final Widget? backButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backButton,
      centerTitle: true,
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(title),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
