import 'package:flutter/material.dart';
import 'package:website/components/header.dart';
import 'package:website/components/resume_section.dart';
import 'package:website/main.dart';
import 'package:website/texts.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("res/TUM.jpg"),
              colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor.withOpacity(IMG_OPACITY),
                  BlendMode.darken),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Header(
                  text: "Education",
                  light: true,
                ),
              ),
              ResumeSection(
                title: "M. Sc. Informatics",
                date: "2020 - Present",
                location: "Munich",
                institution: "TU Munich",
                institutionUrl: "https://www.tum.de/",
                description: TUM,
                whiteText: true,
                // image: 'res/TUM.jpg',
              ),
            ],
          ),
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
          color: Theme.of(context).backgroundColor,
          child: Center(
            child: Header(text: "Work experience"),
          ),
        ),
        ResumeSection(
          title: "Coorporate Student",
          date: "2017 - 2020",
          location: "Ditzingen",
          institution: "TRUMPF",
          institutionUrl: "https://www.trumpf.com/en_INT/",
          description: TRUMPF,
          dark: true,
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
    );
  }
}
