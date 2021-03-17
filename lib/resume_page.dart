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
    var margin1size = getMargin1size(context);
    return p.Page(
      dark: true,
      coverScreenHeight: true,
      restrictScreenHeight: false,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(margin1size),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.school,
                      size: getH1size(context),
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
                Container(
                  height: margin1size,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: margin1size,
                        runSpacing: margin1size,
                        children: [
                          Container(
                            width: screenWidth > SWIDTH
                                ? (screenWidth - 3 * margin1size) / 2
                                : screenWidth - 2 * margin1size,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Education",
                                  style: getH2Style(context),
                                ),
                                Container(
                                  height: margin1size,
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
                                ? (screenWidth - 3 * margin1size) / 2
                                : screenWidth - 2 * margin1size,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Work experience",
                                  style: getH2Style(context),
                                ),
                                Container(
                                  height: margin1size,
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
                      label: Text("PDF"),
                      icon: Icon(Icons.download_sharp),
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
    var margin1size = getMargin1size(context);
    var text2size = getText1size(context);
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: margin1size / 2),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.fiber_manual_record),
                ),
                Container(
                  width: margin1size / 2,
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
                                spacing: margin1size / 2,
                                runSpacing: text2size / 2,
                                children: [
                                  Text(
                                    widget.date,
                                    style: getText1Style(context),
                                  ),
                                  Text(
                                    widget.title,
                                    textAlign: TextAlign.end,
                                    style: getText1Style(context),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: text2size,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                alignment: WrapAlignment.spaceBetween,
                                spacing: margin1size / 2,
                                children: [
                                  Chip(
                                    label: Text(
                                      widget.location,
                                      style: getText1Style(context),
                                    ),
                                    avatar: Icon(
                                      Icons.location_pin,
                                      size: text2size,
                                    ),
                                  ),
                                  Chip(
                                    label: Text(
                                      widget.institution,
                                      textAlign: TextAlign.end,
                                      style: getText1Style(context),
                                    ),
                                    avatar: Icon(
                                      Icons.house,
                                      size: text2size,
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
                                      height: margin1size / 2,
                                    ),
                                    Text(
                                      widget.description,
                                      style: getText1Style(context),
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
                  width: margin1size / 2,
                ),
                IconButton(
                  icon: Icon(expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down),
                  onPressed: () => setState(() => expanded = !expanded),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
