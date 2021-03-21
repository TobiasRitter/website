import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final Function()? onPressed;
  final Widget child;

  const HoverButton({
    Key? key,
    this.onPressed,
    required this.child,
  }) : super(key: key);
  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool underCursor = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (details) => setState(() => underCursor = true),
      onExit: (details) => setState(() => underCursor = false),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: underCursor ? Theme.of(context).canvasColor : null,
          backgroundColor: underCursor ? Theme.of(context).accentColor : null,
        ),
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}
