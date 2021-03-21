import 'package:flutter/material.dart';
import 'package:website/main.dart';

class ResumeSection extends StatefulWidget {
  final String title;
  final String date;
  final String institution;
  final String location;
  final String description;

  const ResumeSection({
    Key? key,
    required this.title,
    required this.date,
    required this.institution,
    required this.location,
    required this.description,
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
                buildInfo(context, width: 300),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: marginSize),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.description,
                        softWrap: true,
                        style: textStyle,
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
                      style: textStyle,
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
              style: textStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: h3Style,
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
                      style: textStyle,
                    ),
                    avatar: Icon(
                      Icons.location_pin,
                      size: textStyle.fontSize,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(
                    label: Text(
                      widget.institution,
                      textAlign: TextAlign.end,
                      style: textStyle,
                    ),
                    avatar: Icon(
                      Icons.house,
                      size: textStyle.fontSize,
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
