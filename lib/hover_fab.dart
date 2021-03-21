import 'package:flutter/material.dart';

class HoverFab extends StatefulWidget {
  final Function()? onPressed;
  final IconData icon;

  const HoverFab({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);
  @override
  _HoverFabState createState() => _HoverFabState();
}

class _HoverFabState extends State<HoverFab> {
  bool underCursor = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (details) => setState(() => underCursor = true),
      onExit: (details) => setState(() => underCursor = false),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: underCursor ? Theme.of(context).accentColor : null,
        ),
        onPressed: widget.onPressed,
        child: Icon(
          widget.icon,
          color: underCursor
              ? Theme.of(context).canvasColor
              : Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
