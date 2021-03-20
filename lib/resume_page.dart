import 'package:flutter/material.dart';
import 'package:website/header.dart';
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
      themeData: darkTheme,
      coverScreenHeight: true,
      restrictScreenHeight: false,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(marginSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Header(
                  text: "Resume",
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(marginSize),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: screenWidth > SWIDTH
                                          ? marginSize
                                          : marginSize * 2),
                                  child: Text(
                                    "Education",
                                    style: h2Style.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color),
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
                                      "Bachelor studies in Computer Science in cooperation with TRUMPF GmbH + Co. KG\n\nElective courses: Python, Data Science, Big Data",
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(marginSize),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: screenWidth > SWIDTH
                                          ? marginSize
                                          : marginSize * 2),
                                  child: Text(
                                    "Work experience",
                                    style: h2Style.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color),
                                  ),
                                ),
                                ResumeSection(
                                  title: "Coorporate Student",
                                  date: "2017-2020",
                                  location: "Ditzingen",
                                  institution: "TRUMPF GmbH + Co. KG",
                                  description:
                                      "18 months of internships in various software development departments\n\nBachelor thesis: Developed a regression model for predicting manual labor times in sheet-metal production, evaluated various models from scikit-learn and XGBoost",
                                ),
                                ResumeSection(
                                  title: "Summer Intern",
                                  date: "05/2019-08/2019",
                                  location: "Farmington, CT, USA",
                                  institution: "TRUMPF Inc.",
                                  description:
                                      "4 month internship at TRUMPF North America within the software development department",
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
                      onPressed: () {},
                      label: Text(
                        "PDF",
                      ),
                      icon: Icon(
                        Icons.download_sharp,
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
