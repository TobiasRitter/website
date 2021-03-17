import 'package:flutter/material.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

class ResumePage extends StatelessWidget {
  const ResumePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var marginSize = getMarginSize(context);
    return p.Page(
      dark: true,
      coverScreenHeight: true,
      restrictScreenHeight: false,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(marginSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: marginSize),
                  child: Row(
                    children: [
                      Icon(
                        Icons.school,
                        size: getH1Style(context).fontSize,
                      ),
                      Container(
                        width: 32,
                      ),
                      Text(
                        "Resume",
                        style: getH1Style(context),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: marginSize,
                        runSpacing: marginSize,
                        children: [
                          Container(
                            width: screenWidth > SWIDTH
                                ? (screenWidth - 3 * marginSize) / 2
                                : screenWidth - 2 * marginSize,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: marginSize),
                                  child: Text(
                                    "Education",
                                    style: getH2Style(context),
                                  ),
                                ),
                                ResumeSection(
                                  title: "M. Sc. Informatics",
                                  date: "2020-2023",
                                  location: "Munich",
                                  institution: "Technical University of Munich",
                                  description:
                                      "Master studies in Computer Science with a focus on the area \"Machine Learning and Analytics\"",
                                ),
                                ResumeSection(
                                  title: "B. Sc. Computer Science",
                                  date: "2017-2020",
                                  location: "Stuttgart",
                                  institution: "DHBW Stuttgart",
                                  description:
                                      "Bachelor studies in Computer Science in cooperation with TRUMPF GmbH + Co. KG",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth > SWIDTH
                                ? (screenWidth - 3 * marginSize) / 2
                                : screenWidth - 2 * marginSize,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: marginSize),
                                  child: Text(
                                    "Work experience",
                                    style: getH2Style(context),
                                  ),
                                ),
                                ResumeSection(
                                  title: "Coorporate Student",
                                  date: "2017-2020",
                                  location: "Ditzingen",
                                  institution: "TRUMPF GmbH + Co. KG",
                                  description:
                                      "18 months of internships in various software development departments.",
                                ),
                                ResumeSection(
                                  title: "Summer Intern",
                                  date: "05/2019-08/2019",
                                  location: "Farmington, CT, USA",
                                  institution: "TRUMPF Inc.",
                                  description:
                                      "4 month internship at TRUMPF North America within the software development department.",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: null,
                      label: Text(
                        "PDF",
                        style: getFabStyle(context),
                      ),
                      icon: Icon(
                        Icons.download_sharp,
                        size: getFabStyle(context).fontSize,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

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
