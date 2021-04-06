import 'package:flutter/material.dart';
import 'package:website/hover_button.dart';
import 'package:website/main.dart';

class ResumeSection extends StatefulWidget {
  final String title;
  final String date;
  final String institution;
  final String location;
  final String description;
  final String institutionUrl;
  final String? image;
  final IconData icon;

  const ResumeSection({
    Key? key,
    required this.title,
    required this.date,
    required this.institution,
    required this.location,
    required this.description,
    required this.institutionUrl,
    required this.icon,
    this.image,
  }) : super(key: key);

  @override
  _ResumeSectionState createState() => _ResumeSectionState();
}

class _ResumeSectionState extends State<ResumeSection> {
  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      child: Stack(
        children: [
          widget.image != null
              ? Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        widget.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              : Container(),
          widget.image != null
              ? Opacity(
                  opacity: IMG_OPACITY,
                  child: Container(
                    color: Colors.black,
                  ),
                )
              : Container(),
          Center(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: screenWidth > CONTENT_WIDTH
                      ? CONTENT_WIDTH
                      : screenWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Line(
                      light: widget.image != null,
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: buildInfo(context),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: marginSize),
                            child: SelectableText(
                              widget.description,
                              style: widget.image != null
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: Theme.of(context).canvasColor)
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Line(
                      light: widget.image != null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfo(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: marginSize,
                child: CircleSection(
                  light: widget.image != null,
                ),
              ),
              Expanded(
                child: SelectableText(
                  widget.title,
                  style: widget.image != null
                      ? Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Theme.of(context).canvasColor)
                      : Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Line(
                light: widget.image != null,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_sharp,
                        color: widget.image != null
                            ? Theme.of(context).canvasColor
                            : null,
                      ),
                      Container(width: 16),
                      SelectableText(
                        widget.date,
                        style: widget.image != null
                            ? Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Theme.of(context).canvasColor)
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Line(
                light: widget.image != null,
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: widget.image != null
                          ? Theme.of(context).canvasColor
                          : null,
                    ),
                    Container(width: 16),
                    SelectableText(
                      widget.location,
                      style: widget.image != null
                          ? Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Theme.of(context).canvasColor)
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Line(
          light: widget.image != null,
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Line(
                light: widget.image != null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: HoverButton(
                  onPressed: () => launchURL(widget.institutionUrl),
                  text: widget.institution,
                  light: widget.image != null,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Line(
            light: widget.image != null,
          ),
        ),
      ],
    );
  }
}

class CircleSection extends StatelessWidget {
  final bool light;

  const CircleSection({
    Key? key,
    this.light = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Line(
            light: light,
          ),
        ),
        Opacity(
          opacity: BORDER_OPACITY,
          child: Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(
                width: 4,
                color: light
                    ? Theme.of(context).canvasColor
                    : Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: Line(
            light: light,
          ),
        ),
      ],
    );
  }
}

class Line extends StatelessWidget {
  final bool light;
  const Line({
    Key? key,
    this.light = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Opacity(
      opacity: BORDER_OPACITY,
      child: Container(
        width: marginSize,
        child: Center(
          child: Container(
            color: light
                ? Theme.of(context).canvasColor
                : Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
