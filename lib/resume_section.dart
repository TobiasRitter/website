import 'package:auto_size_text/auto_size_text.dart';
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
      child: Wrap(
        spacing: marginSize / 2,
        runSpacing: marginSize,
        children: [
          Container(
            width: screenWidth > SWIDTH ? 300 : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.date,
                  style: textStyle.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    widget.title,
                    style: h3Style.copyWith(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Chip(
                    label: Text(
                      widget.location,
                      style: textStyle.copyWith(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    avatar: Icon(
                      Icons.location_pin,
                      size: textStyle.fontSize,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Chip(
                    label: Text(
                      widget.institution,
                      textAlign: TextAlign.end,
                      style: textStyle.copyWith(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
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
          Container(
            width: screenWidth > SWIDTH
                ? (screenWidth - 7 * marginSize) / 2 - 300 - marginSize / 2
                : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  widget.description,
                  style: textStyle.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color,
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
