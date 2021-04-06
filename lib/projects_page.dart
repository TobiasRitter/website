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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: marginSize * 3),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth:
                    screenWidth > CONTENT_WIDTH ? CONTENT_WIDTH : screenWidth),
            child: Padding(
              padding:
                  EdgeInsets.fromLTRB(marginSize, marginSize, marginSize, 0),
              child: Header(
                text: 'Projects',
                padding: false,
              ),
            ),
          ),
          ProjectSection(
            title: 'PyNN',
            url: 'https://github.com/TobiasRitter/PyNN',
            description: PYNN,
            image: 'res/PyNN.png',
            technology: 'Python, numpy, pandas',
            platform: 'Desktop',
          ),
          ProjectSection(
            title: 'RGB LED',
            url: 'https://github.com/TobiasRitter/flutter_rgb_leds',
            description: RGB_LED,
            image: 'res/RGBLed.png',
            inversed: true,
            dark: true,
            technology: 'Flutter',
            platform: 'Android',
          ),
          ProjectSection(
            title: 'Cardgame',
            url: 'https://github.com/TobiasRitter/Cardgame',
            description: CARDGAME,
            image: 'res/Cardgame.png',
            technology: 'Flutter, Dart',
            platform: 'Web',
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
      ),
    );
  }
}
