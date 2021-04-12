import 'package:flutter/material.dart';
import 'package:website/header.dart';
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
    var horizontalMargin = getRelativeHorizontalSize(context);
    var verticalMargin = getRelativeVerticalSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(minHeight: screenHeight),
      color: widget.dark
          ? Theme.of(context).cardColor
          : Theme.of(context).canvasColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalMargin * 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.header ?? Container(),
            Center(
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: screenWidth > MAX_CONTENT_WIDTH
                        ? MAX_CONTENT_WIDTH
                        : screenWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
                  child: isPortrait(context)
                      ? buildMobileLayout()
                      : buildDesktopLayout(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildMobileLayout() {
    var verticalMargin = getRelativeVerticalSize(context);
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Material(
          elevation: IMG_ELEVATION,
          child: Container(
            constraints: BoxConstraints(maxHeight: screenHeight / 2),
            child: Image.asset(
              widget.image,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMargin * 2),
          child: buildInfo(),
        ),
      ],
    );
  }

  Row buildDesktopLayout() {
    var horizontalMargin = getRelativeHorizontalSize(context);
    var screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        widget.inversed
            ? Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: horizontalMargin / 2),
                  child: buildInfo(),
                ),
              )
            : Container(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                widget.inversed ? horizontalMargin / 2 : 0,
                0,
                widget.inversed ? 0 : horizontalMargin / 2,
                0),
            child: Container(
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints(maxHeight: screenHeight / 2),
              child: Material(
                elevation: IMG_ELEVATION,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
          ),
        ),
        widget.inversed
            ? Container()
            : Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: horizontalMargin / 2),
                  child: buildInfo(),
                ),
              ),
      ],
    );
  }

  Widget buildInfo() {
    var verticalMargin = getRelativeVerticalSize(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(
          text: widget.title,
          h2: true,
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMargin),
          child: SelectableText(
            widget.description,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMargin),
          child: FloatingActionButton.extended(
            onPressed: () => launchURL(widget.url),
            label: Text("Show on GitHub"),
          ),
        )
      ],
    );
  }
}
