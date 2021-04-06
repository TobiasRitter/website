import 'package:flutter/material.dart';
import 'package:website/header.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;
import 'package:website/resume_section.dart';
import 'package:website/texts.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: marginSize * 3),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth:
                    screenWidth > CONTENT_WIDTH ? CONTENT_WIDTH : screenWidth),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: marginSize),
              child: Header(
                text: "Resume",
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
                maxWidth:
                    screenWidth > CONTENT_WIDTH ? CONTENT_WIDTH : screenWidth),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  marginSize, 0, marginSize, marginSize * 2),
              child: Row(
                children: [
                  SelectableText(
                    "Education",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
          ),
          ResumeSection(
            title: "M. Sc. Informatics",
            date: "2020 - Present",
            location: "Munich",
            institution: "TU Munich",
            institutionUrl: "https://www.tum.de/",
            description: TUM,
            image: 'res/TUM.jpg',
          ),
          ResumeSection(
            title: "B. Sc. Computer Science",
            date: "2017 - 2020",
            location: "Stuttgart",
            institution: "DHBW Stuttgart",
            institutionUrl: "https://www.dhbw-stuttgart.de/",
            description: DHBW,
          ),
          Container(
            constraints: BoxConstraints(
                maxWidth:
                    screenWidth > CONTENT_WIDTH ? CONTENT_WIDTH : screenWidth),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: marginSize * 2, horizontal: marginSize),
              child: Row(
                children: [
                  SelectableText(
                    "Work experience",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
          ),
          ResumeSection(
            title: "Coorporate Student",
            date: "2017 - 2020",
            location: "Ditzingen",
            institution: "TRUMPF",
            institutionUrl: "https://www.trumpf.com/en_INT/",
            description: TRUMPF,
          ),
          ResumeSection(
            title: "Summer Intern",
            date: "05/2019 - 08/2019",
            location: "Farmington, CT, USA",
            institution: "TRUMPF US",
            institutionUrl:
                "https://www.trumpf.com/en_US/local-pages/us/company/about-trumpf-in-the-us/",
            description: TRUMPF_US,
            image: 'res/NYC.jpg',
          ),
        ],
      ),
    );
  }
}
