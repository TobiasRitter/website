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
      padding: EdgeInsets.only(bottom: marginSize * 2),
      child: screenWidth > SWIDTH
          ? Row(
              children: [
                buildInfo(context),
                Expanded(
                  child: Text(
                    widget.description,
                    softWrap: true,
                    style: textStyle.copyWith(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                buildInfo(context),
                Text(
                  widget.description,
                  softWrap: true,
                  style: textStyle.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildInfo(BuildContext context) {
    return Container(
      width: 300,
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
    );
  }
}
