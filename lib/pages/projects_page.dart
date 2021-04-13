import 'package:flutter/material.dart';
import 'package:website/components/animated_section.dart';
import 'package:website/components/header.dart';
import 'package:website/components/project_section.dart';
import 'package:website/texts.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          child: Center(
            child: Header(
              text: "Projects",
              animated: true,
            ),
          ),
        ),
        ProjectSection(
          title: 'PyNN',
          url: 'https://github.com/TobiasRitter/PyNN',
          description: PYNN,
          image: 'res/PyNN.png',
          dark: true,
        ),
        ProjectSection(
          title: 'RGB LED',
          url: 'https://github.com/TobiasRitter/flutter_rgb_leds',
          description: RGB_LED,
          image: 'res/RGBLed.png',
          inversed: true,
        ),
        ProjectSection(
          title: 'Cardgame',
          url: 'https://github.com/TobiasRitter/Cardgame',
          description: CARDGAME,
          image: 'res/Cardgame.png',
          dark: true,
        ),
        ProjectSection(
          title: 'CleverConvert',
          url: 'https://github.com/TobiasRitter/cleverconvert',
          description: CLEVER_CONVERT,
          image: 'res/CleverConvert.png',
          inversed: true,
        ),
      ],
    );
  }
}
