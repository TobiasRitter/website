import 'package:flutter/material.dart';
import 'package:website/main.dart';

class ProjectSection extends StatefulWidget {
  ProjectSection({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.headerColor,
    this.dark = false,
  }) : super(key: key);

  final String title;
  final String description;
  final String image;
  final bool dark;
  final Color headerColor;

  @override
  _ProjectSectionState createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    return Theme(
      data: widget.dark ? darkTheme : lightTheme,
      child: Builder(
        builder: (context) {
          return Container(
            width: screenWidth > SWIDTH
                ? (screenWidth - 5 * marginSize) / 4
                : screenWidth,
            height: screenWidth > SWIDTH
                ? (screenWidth - 5 * marginSize) / 4 * 1.75
                : screenWidth * 1.75,
            child: Material(
              elevation: 32,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: widget.headerColor,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(marginSize / 2),
                              child: Image.asset(
                                widget.image,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(marginSize),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            textAlign: TextAlign.center,
                            style: getH2Style(context),
                          ),
                          Text(
                            widget.description,
                            style: getTextStyle(context),
                          ),
                          TextButton.icon(
                            onPressed: null,
                            label: Text(
                              "Show on GitHub",
                              style: getAccentButtonStyle(context),
                            ),
                            icon: Icon(
                              Icons.open_in_browser,
                              color: Theme.of(context).accentColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
