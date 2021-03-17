import 'package:flutter/material.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;
import 'package:website/resume_section.dart';

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