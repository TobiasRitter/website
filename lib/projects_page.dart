import 'package:flutter/material.dart';
import 'package:website/header.dart';
import 'package:website/project_section.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;
import 'package:website/texts.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    return p.Page(
      coverScreenHeight: true,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: marginSize * 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: screenWidth > CONTENT_WIDTH
                      ? CONTENT_WIDTH
                      : screenWidth),
              child: Padding(
                padding: EdgeInsets.all(marginSize),
                child: Column(
                  children: [
                    Header(
                      text: "Projects",
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ProjectSection(
                                title: 'PyNN',
                                url: 'https://github.com/TobiasRitter/PyNN',
                                description: PYNN,
                                image: 'res/PyNN.png',
                                headerColor: Color.fromARGB(255, 30, 30, 30),
                              ),
                              ProjectSection(
                                title: 'RGB LED',
                                url:
                                    'https://github.com/TobiasRitter/flutter_rgb_leds',
                                description: RGB_LED,
                                image: 'res/RGBLed.png',
                                headerColor: Color.fromARGB(255, 30, 30, 30),
                                inversed: true,
                              ),
                              ProjectSection(
                                title: 'Cardgame',
                                url: 'https://github.com/TobiasRitter/Cardgame',
                                description: CARDGAME,
                                image: 'res/Cardgame.png',
                                headerColor: ThemeData.dark().canvasColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
