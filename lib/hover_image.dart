import 'package:flutter/material.dart';
import 'package:website/main.dart';

class HoverImage extends StatefulWidget {
  const HoverImage({
    Key? key,
    required this.url,
    required this.image,
  }) : super(key: key);

  final String url;
  final String image;

  @override
  _HoverImageState createState() => _HoverImageState();
}

class _HoverImageState extends State<HoverImage> {
  bool underCursor = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => underCursor = true),
      onExit: (_) => setState(() => underCursor = false),
      child: GestureDetector(
        onTap: () => launchURL(widget.url),
        child: Material(
          elevation: underCursor ? IMG_ELEVATION * 2 : IMG_ELEVATION,
          child: Image.asset(
            widget.image,
            fit: BoxFit.contain,
            alignment: Alignment.centerLeft,
          ),
        ),
      ),
    );
  }
}
