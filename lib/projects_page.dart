import 'package:flutter/material.dart';
import 'package:website/project_section.dart';
import 'package:website/main.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Theme(
      data: lightTheme,
      child: Builder(
        builder: (context) {
          return Container(
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 64, 32, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      children: [
                        Icon(
                          Icons.code,
                          size: getH1size(context),
                        ),
                        Container(
                          width: 32,
                        ),
                        Text(
                          "Projects",
                          style: TextStyle(
                            fontSize: getH1size(context),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 32,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 1.5,
                    crossAxisCount: screenWidth > 800 ? 2 : 1,
                    children: [
                      ProjectSection(
                        title: 'RGB LED',
                        image: 'res/RGBLed.png',
                      ),
                      ProjectSection(
                        title: 'Cardgame',
                        image: 'res/Cardgame.png',
                      ),
                      ProjectSection(
                        title: 'CleverConvert',
                        image: 'res/CleverConvert.png',
                        dark: false,
                      ),
                      ProjectSection(
                        title: 'Data Mining Algorithms',
                        image: 'res/ClojureAlgos.png',
                      ),
                      ProjectSection(
                        title: 'PyNN',
                        image: 'res/ClojureAlgos.png',
                      ),
                    ],
                  ),
                  Container(
                    height: 32,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
