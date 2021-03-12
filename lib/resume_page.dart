import 'package:flutter/material.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.school,
                  size: 128,
                ),
                Container(
                  width: 32,
                ),
                Text(
                  "Resume",
                  style: TextStyle(
                    fontSize: 96,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Wrap(
              children: [
                Container(
                  width: screenWidth > 800
                      ? (screenWidth - 128) / 2
                      : screenWidth - 128,
                  child: Padding(
                    padding: const EdgeInsets.all(64),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Education",
                          style: TextStyle(
                            fontSize: 42,
                          ),
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
                  width: screenWidth > 800
                      ? (screenWidth - 128) / 2
                      : screenWidth - 128,
                  child: Padding(
                    padding: const EdgeInsets.all(64),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Work experience",
                          style: TextStyle(
                            fontSize: 42,
                          ),
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
          ),
          Container(
            width: 64,
          ),
          Expanded(
            child: Text(
              widget.title,
            ),
          ),
          Container(
            width: 64,
          ),
          Text(
            widget.institution,
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
