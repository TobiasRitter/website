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
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
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
                    size: h2Style.fontSize,
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
                                runSpacing: textStyle.fontSize! / 2,
                                children: [
                                  Text(
                                    widget.date,
                                    style: textStyle.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                                  ),
                                  Text(
                                    widget.title,
                                    style: textStyle.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: textStyle.fontSize,
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
                                    label: AutoSizeText(
                                      widget.location,
                                      style: textStyle.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                      ),
                                    ),
                                    avatar: Icon(
                                      Icons.location_pin,
                                      size: textStyle.fontSize,
                                    ),
                                  ),
                                  Chip(
                                    label: AutoSizeText(
                                      widget.institution,
                                      textAlign: TextAlign.end,
                                      style: textStyle.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                      ),
                                    ),
                                    avatar: Icon(
                                      Icons.house,
                                      size: textStyle.fontSize,
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
                                    AutoSizeText(
                                      widget.description,
                                      style: textStyle.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                      ),
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
                      size: h2Style.fontSize,
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
