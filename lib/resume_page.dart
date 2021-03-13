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
    return p.Page(
      dark: true,
      coverScreenHeight: true,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(64),
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
                Wrap(
                  children: [
                    Container(
                      width: screenWidth > SWIDTH
                          ? (screenWidth - 128) / 2
                          : screenWidth - 128,
                      child: Padding(
                        padding: const EdgeInsets.all(64),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Education",
                              style: getH2Style(context),
                            ),
                            Container(
                              height: 64,
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
                    ),
                    Container(
                      width: screenWidth > SWIDTH
                          ? (screenWidth - 128) / 2
                          : screenWidth - 128,
                      child: Padding(
                        padding: const EdgeInsets.all(64),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Work experience",
                              style: getH2Style(context),
                            ),
                            Container(
                              height: 64,
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
    return ExpansionTile(
      leading: Icon(Icons.fiber_manual_record),
      title: Row(
        children: [
          Text(
            widget.date,
            style: getText2Style(context),
          ),
          Container(
            width: 64,
          ),
          Expanded(
            child: Text(
              widget.title,
              style: getText2Style(context),
            ),
          ),
          Container(
            width: 64,
          ),
          Expanded(
            child: Text(
              widget.institution,
              style: getText2Style(context),
            ),
          ),
        ],
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.location_pin),
              Container(
                width: 28,
              ),
              Text(
                widget.location,
                style: getText2Style(context),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.description,
          ),
        ),
      ],
    );
  }
}
