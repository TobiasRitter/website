import 'package:flutter/material.dart';
import 'package:website/hover_button.dart';
import 'package:website/main.dart';

class ProjectSection extends StatefulWidget {
  ProjectSection({
    Key? key,
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    this.inversed = false,
    this.dark = false,
    this.header,
  }) : super(key: key);

  final String title;
  final String description;
  final String url;
  final String image;
  final bool inversed;
  final bool dark;
  final Widget? header;

  @override
  _ProjectSectionState createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(minHeight: screenHeight),
      color: widget.dark
          ? Theme.of(context).cardColor
          : Theme.of(context).canvasColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: marginSize * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.header ?? Container(),
            Center(
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: screenWidth > CONTENT_WIDTH
                        ? CONTENT_WIDTH
                        : screenWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: marginSize),
                  child: screenWidth > SWIDTH
                      ? buildDesktopLayout(marginSize)
                      : buildMobileLayout(screenHeight, marginSize),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildMobileLayout(double screenHeight, double marginSize) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: screenHeight / 2),
          child: Image.asset(
            widget.image,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: marginSize * 3),
          child: buildInfo(center: true),
        ),
      ],
    );
  }

  Row buildDesktopLayout(double marginSize) {
    return Row(
      children: [
        widget.inversed
            ? Expanded(
                child: buildInfo(),
              )
            : Container(),
        Container(
          width: widget.inversed ? marginSize * 2 : 0,
        ),
        Expanded(
          child: Image.asset(
            widget.image,
            fit: BoxFit.contain,
            alignment: Alignment.centerLeft,
          ),
        ),
        Container(
          width: widget.inversed ? 0 : marginSize * 2,
        ),
        widget.inversed
            ? Container()
            : Expanded(
                child: buildInfo(),
              ),
      ],
    );
  }

  Widget buildInfo({bool center = false}) {
    var marginSize = getMarginSize(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        SelectableText(
          widget.title,
          maxLines: 1,
          style: Theme.of(context).textTheme.headline2,
        ),
        Container(
          height: marginSize,
        ),
        SelectableText(
          widget.description,
        ),
        Container(
          height: marginSize,
        ),
        HoverButton(
          onPressed: () => launchURL(widget.url),
          text: "Show on GitHub",
        )
      ],
    );
  }
}
