import 'package:flutter/material.dart';
import 'package:website/components/animated_section.dart';
import 'package:website/components/header.dart';
import 'package:website/components/hover_image.dart';
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
          ? Theme.of(context).canvasColor
          : Theme.of(context).backgroundColor,
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
                  child: AnimatedSection(
                    key: Key(widget.title),
                    child: isPortrait(context)
                        ? buildMobileLayout()
                        : buildDesktopLayout(),
                  ),
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
        Container(
          constraints: BoxConstraints(maxHeight: screenHeight / 2),
          child: HoverImage(
            image: widget.image,
            url: widget.url,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMargin * 3),
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
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints(maxHeight: screenHeight / 2),
              child: HoverImage(
                image: widget.image,
                url: widget.url,
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

  Widget buildInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(
          text: widget.title,
          h2: true,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: SelectableText(
            widget.description,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: FloatingActionButton.extended(
            onPressed: () => launchURL(widget.url),
            label: Text("Show on GitHub"),
          ),
        )
      ],
    );
  }
}
