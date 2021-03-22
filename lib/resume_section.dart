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
  }) : super(key: key);

  @override
  _ResumeSectionState createState() => _ResumeSectionState();
}

class _ResumeSectionState extends State<ResumeSection> {
  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > SWIDTH
        ? Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: buildInfo(context)),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: marginSize),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.description,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: marginSize,
                    child: Line(),
                  ),
                ],
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInfo(context),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Line(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, marginSize / 2, 0, marginSize),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.description,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
              Line(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.date,
                  ),
                ),
              ),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: marginSize,
                child: CircleSection(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Line(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.location,
                  ),
                ),
              ),
            ],
          ),
        ),
        Line(),
        IntrinsicHeight(
          child: Row(
            children: [
              Line(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HoverButton(
                  onPressed: () => launchURL(widget.institutionUrl),
                  child: Text(
                    widget.institution,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CircleSection extends StatelessWidget {
  const CircleSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Line(),
        ),
        Opacity(
          opacity: LINE_OPACITY,
          child: Container(
            height: 16,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Line(),
        ),
      ],
    );
  }
}

class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Opacity(
      opacity: LINE_OPACITY,
      child: Container(
        width: marginSize,
        child: Center(
          child: Container(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
