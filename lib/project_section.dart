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
    required this.platform,
    required this.technology,
    this.inversed = false,
  }) : super(key: key);

  final String title;
  final String description;
  final String url;
  final String image;
  final String platform;
  final String technology;
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
              child: Row(
                children: [
                  !widget.inversed
                      ? Container()
                      : Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(marginSize),
                            child: buildInfo(),
                          ),
                        ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: marginSize),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  widget.inversed
                      ? Container()
                      : Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(marginSize),
                            child: buildInfo(),
                          ),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: marginSize),
                    child: buildInfo(),
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildInfo() {
    var marginSize = getMarginSize(context);
    return Column(
      children: [
        SelectableText(
          widget.title,
          maxLines: 1,
          style: Theme.of(context).textTheme.headline2,
        ),
        Container(
          height: marginSize,
        ),
        Row(
          children: [
            Icon(Icons.memory_sharp),
            Container(width: 16),
            SelectableText(widget.platform),
          ],
        ),
        Container(
          height: 16,
        ),
        Row(
          children: [
            Icon(Icons.code_sharp),
            Container(width: 16),
            SelectableText(widget.technology),
          ],
        ),
        Container(
          height: marginSize / 2,
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
