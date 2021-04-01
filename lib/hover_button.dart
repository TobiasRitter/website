import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final void Function()? onPressed;
  final String text;

  const HoverButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool underCursor = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => underCursor = true),
      onExit: (_) => setState(() => underCursor = false),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: underCursor ? Theme.of(context).canvasColor : null,
          backgroundColor: underCursor ? Theme.of(context).accentColor : null,
        ),
        onPressed: widget.onPressed,
        child: Text(widget.text),
      ),
    );
  }
}
