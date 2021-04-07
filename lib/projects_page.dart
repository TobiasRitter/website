import 'package:flutter/material.dart';
import 'package:website/header.dart';
import 'package:website/project_section.dart';
import 'package:website/main.dart';
import 'package:website/texts.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ProjectSection(
          title: 'PyNN',
          url: 'https://github.com/TobiasRitter/PyNN',
          description: PYNN,
          image: 'res/PyNN.png',
          header: Container(
            constraints: BoxConstraints(
                maxWidth:
                    screenWidth > CONTENT_WIDTH ? CONTENT_WIDTH : screenWidth),
            child: Padding(
              padding: EdgeInsets.fromLTRB(marginSize, 0, marginSize, 0),
              child: Header(
                text: 'Projects',
              ),
            ),
          ),
        ),
        ProjectSection(
          title: 'RGB LED',
          url: 'https://github.com/TobiasRitter/flutter_rgb_leds',
          description: RGB_LED,
          image: 'res/RGBLed.png',
          inversed: true,
          dark: true,
        ),
        ProjectSection(
          title: 'Cardgame',
          url: 'https://github.com/TobiasRitter/Cardgame',
          description: CARDGAME,
          image: 'res/Cardgame.png',
        ),
        // ProjectSection(
        //   title: 'CleverConvert',
        //   url: 'https://github.com/TobiasRitter/cleverconvert',
        //   description: CLEVER_CONVERT,
        //   image: 'res/CleverConvert.png',
        //   inversed: true,
        //   dark: true,
        //   technology: 'Flutter',
        //   platform: 'Android',
        // ),
      ],
    );
  }
}
