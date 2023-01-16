import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.height,
    required this.title,
    this.backButton,
  });

  final double height;
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
  Size get preferredSize => Size.fromHeight(height);
}
