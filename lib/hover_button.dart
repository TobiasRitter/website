import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final void Function()? onPressed;
  final String text;
  final bool light;

  const HoverButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.light = false,
  }) : super(key: key);
  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool underCursor = false;

  @override
  Widget build(BuildContext context) {
    var bgColor = widget.light
        ? Theme.of(context).canvasColor
        : Theme.of(context).accentColor;
    var textColorActive = widget.light
        ? Theme.of(context).accentColor
        : Theme.of(context).canvasColor;
    var textColorInactive = widget.light
        ? Theme.of(context).canvasColor
        : Theme.of(context).accentColor;
    return MouseRegion(
      onEnter: (_) => setState(() => underCursor = true),
      onExit: (_) => setState(() => underCursor = false),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: underCursor ? textColorActive : textColorInactive,
          backgroundColor: underCursor ? bgColor : null,
          side: BorderSide(
            color: widget.light
                ? Theme.of(context).canvasColor
                : Theme.of(context).primaryColor,
            width: 3,
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(widget.text),
      ),
    );
  }
}
