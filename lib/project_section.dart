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
  }) : super(key: key);

  final String title;
  final String description;
  final String url;
  final String image;
  final bool inversed;

  @override
  _ProjectSectionState createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: marginSize * 2),
      child: screenWidth > SWIDTH
          ? Container(
              height: 500,
              child: Row(
                children: [
                  !widget.inversed
                      ? Container()
                      : Expanded(
                          child: buildInfo(),
                        ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: marginSize),
                            child: Image.asset(
                              widget.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.inversed
                      ? Container()
                      : Expanded(
                          child: buildInfo(),
                        ),
                ],
              ),
            )
          : Column(
              children: [
                Container(
                  height: screenHeight / 3,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    minHeight: screenHeight / 3,
                  ),
                  child: buildInfo(),
                ),
              ],
            ),
    );
  }

  Widget buildInfo() {
    var marginSize = getMarginSize(context);
    return Padding(
      padding: EdgeInsets.all(marginSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: marginSize),
            child: Text(
              widget.description,
            ),
          ),
          HoverButton(
            onPressed: () => launchURL(widget.url),
            child: Text(
              "Show on GitHub",
            ),
          )
        ],
      ),
    );
  }
}
