import 'package:flutter/material.dart';
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
    return Padding(
      padding: EdgeInsets.only(bottom: marginSize),
      child: screenWidth > SWIDTH
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfo(context, width: RESUME_INFO_WIDTH),
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
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfo(context),
                Padding(
                  padding: EdgeInsets.only(top: marginSize / 2),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.description,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildInfo(BuildContext context, {double? width}) {
    var marginSize = getMarginSize(context);
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.date,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: marginSize / 2),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    label: Text(
                      widget.location,
                    ),
                    avatar: Icon(
                      Icons.location_pin,
                      size: Theme.of(context).chipTheme.labelStyle.fontSize,
                      color: Theme.of(context).chipTheme.labelStyle.color,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionChip(
                    onPressed: () => launchURL(widget.institutionUrl),
                    label: Text(
                      widget.institution,
                      textAlign: TextAlign.end,
                    ),
                    avatar: Icon(
                      widget.icon,
                      size: Theme.of(context).chipTheme.labelStyle.fontSize,
                      color: Theme.of(context).chipTheme.labelStyle.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
