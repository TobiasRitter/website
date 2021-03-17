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
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    var textSize = getTextStyle(context).fontSize!;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: marginSize / 2),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.fiber_manual_record,
                    size: getH2Style(context).fontSize,
                  ),
                ),
                Container(
                  width: marginSize / 2,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                alignment: WrapAlignment.spaceBetween,
                                spacing: marginSize / 2,
                                runSpacing: textSize / 2,
                                children: [
                                  Text(
                                    widget.date,
                                    style: getTextStyle(context),
                                  ),
                                  Text(
                                    widget.title,
                                    style: getTextStyle(context),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: textSize,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                alignment: WrapAlignment.spaceBetween,
                                spacing: marginSize / 2,
                                children: [
                                  Chip(
                                    label: Text(
                                      widget.location,
                                      style: getTextStyle(context),
                                    ),
                                    avatar: Icon(
                                      Icons.location_pin,
                                      size: textSize,
                                    ),
                                  ),
                                  Chip(
                                    label: Text(
                                      widget.institution,
                                      textAlign: TextAlign.end,
                                      style: getTextStyle(context),
                                    ),
                                    avatar: Icon(
                                      Icons.house,
                                      size: textSize,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        AnimatedSwitcher(
                          duration: animationDuration,
                          child: expanded
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: marginSize / 2,
                                    ),
                                    Text(
                                      widget.description,
                                      style: getTextStyle(context),
                                    ),
                                  ],
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: marginSize / 2,
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      expanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: getH2Style(context).fontSize,
                    ),
                  ),
                  onTap: () => setState(() => expanded = !expanded),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
