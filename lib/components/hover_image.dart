import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    return InkWell(
      onTap: () => launchURL(widget.url),
      child: MouseRegion(
        onEnter: (_) => setState(() => underCursor = true),
        onExit: (_) => setState(() => underCursor = false),
        child: Material(
          borderRadius: BorderRadius.circular(IMG_RADIUS),
          clipBehavior: Clip.hardEdge,
          elevation: underCursor ? ELEVATION * 2 : ELEVATION,
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
