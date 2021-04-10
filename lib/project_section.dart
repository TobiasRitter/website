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
    var verticalMargin = getVerticalMargin(context);
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
    var verticalMargin = getVerticalMargin(context);
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: screenHeight / 2),
          child: Image.asset(
            widget.image,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMargin * 2),
          child: buildInfo(center: true),
        ),
      ],
    );
  }

  Row buildDesktopLayout() {
    var horizontalMargin = getHorizontalMargin(context);
    var screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        widget.inversed
            ? Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: horizontalMargin),
                  child: buildInfo(),
                ),
              )
            : Container(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(widget.inversed ? horizontalMargin : 0,
                0, widget.inversed ? 0 : horizontalMargin, 0),
            child: Container(
              constraints: BoxConstraints(maxHeight: screenHeight / 2),
              child: Image.asset(
                widget.image,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
        ),
        widget.inversed
            ? Container()
            : Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: horizontalMargin),
                  child: buildInfo(),
                ),
              ),
      ],
    );
  }

  Widget buildInfo({bool center = false}) {
    var verticalMargin = getVerticalMargin(context);
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
