import 'package:flutter/material.dart';
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
    var horizontalMargin = getHorizontalMargin(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(minHeight: screenHeight),
      color: widget.dark
          ? Theme.of(context).cardColor
          : Theme.of(context).canvasColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: horizontalMargin * 4),
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
                  padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
                  child: screenWidth > SWIDTH
                      ? buildDesktopLayout(horizontalMargin)
                      : buildMobileLayout(screenHeight, horizontalMargin),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildMobileLayout(double screenHeight, double horizontalMargin) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: screenHeight / 2),
          child: Image.asset(
            widget.image,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: horizontalMargin * 3),
          child: buildInfo(center: true),
        ),
      ],
    );
  }

  Row buildDesktopLayout(double horizontalMargin) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        widget.inversed
            ? Expanded(
                child: buildInfo(),
              )
            : Container(),
        Container(
          width: widget.inversed ? horizontalMargin * 2 : 0,
        ),
        Expanded(
          child: Container(
            constraints: BoxConstraints(maxHeight: screenHeight / 2),
            child: Image.asset(
              widget.image,
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        Container(
          width: widget.inversed ? 0 : horizontalMargin * 2,
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
    var horizontalMargin = getHorizontalMargin(context);
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
          height: horizontalMargin,
        ),
        SelectableText(
          widget.description,
        ),
        Container(
          height: horizontalMargin,
        ),
        FloatingActionButton.extended(
          onPressed: () => launchURL(widget.url),
          label: Text("Show on GitHub"),
        )
      ],
    );
  }
}
