import 'package:auto_size_text/auto_size_text.dart';
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
            child: Padding(
              padding: EdgeInsets.only(bottom: marginSize),
              child: Material(
                elevation: 32,
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
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(bottom: marginSize),
            child: Material(
              elevation: 32,
              child: Column(
                children: [
                  Container(
                    height: screenHeight / 2,
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
                  buildInfo(),
                ],
              ),
            ),
          );
  }

  Padding buildInfo() {
    var marginSize = getMarginSize(context);
    return Padding(
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
            child: AutoSizeText(
              widget.description,
              minFontSize: 1,
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
    );
  }
}
