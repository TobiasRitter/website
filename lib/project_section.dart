import 'package:flutter/material.dart';
import 'package:website/main.dart';

class ProjectSection extends StatefulWidget {
  ProjectSection({
    Key? key,
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.headerColor,
    this.inversed = false,
  }) : super(key: key);

  final String title;
  final String description;
  final String url;
  final String image;
  final Color headerColor;
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
    return screenWidth > SWIDTH
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
                  child: Container(
                    color: widget.headerColor,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(marginSize / 2),
                            child: Image.asset(
                              widget.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: widget.headerColor,
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(marginSize / 2),
                                child: Image.asset(
                                  widget.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: screenHeight / 3,
                ),
                child: buildInfo(),
              ),
            ],
          );
  }

  Widget buildInfo() {
    var marginSize = getMarginSize(context);
    return Container(
      color: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.all(marginSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: h2Style,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: marginSize / 2),
              child: Text(
                widget.description,
                style: textStyle,
              ),
            ),
            TextButton.icon(
              onPressed: () => launchURL(widget.url),
              label: Text(
                "Show on GitHub",
              ),
              icon: Icon(
                Icons.open_in_browser,
              ),
            )
          ],
        ),
      ),
    );
  }
}
