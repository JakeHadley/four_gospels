import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key,
    required String text,
    required void Function()? action,
    required Color color,
    required Widget iconWidget,
    bool darkText = false,
    bool equalWidth = false,
  })  : _text = text,
        _action = action,
        _color = color,
        _iconWidget = iconWidget,
        _darkText = darkText,
        _equalWidth = equalWidth;

  final String _text;
  final void Function()? _action;
  final Color _color;
  final Widget _iconWidget;
  final bool _darkText;
  final bool _equalWidth;

  @override
  Widget build(BuildContext context) {
    final _border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    );

    final _textStyle = _darkText
        ? Theme.of(context).textTheme.headline4?.copyWith(
              color: Theme.of(context).primaryIconTheme.color,
            )
        : Theme.of(context).textTheme.headline4;

    return SizedBox(
      height: 100,
      child: Card(
        shape: _border,
        color: _color,
        child: InkWell(
          customBorder: _border,
          onTap: _action,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Expanded(flex: _equalWidth ? 1 : 0, child: _iconWidget),
                Expanded(
                  child: Text(
                    _text,
                    style: _textStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
