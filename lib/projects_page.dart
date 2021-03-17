import 'package:flutter/material.dart';
import 'package:website/project_section.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var margin1size = getMarginSize(context);
    return p.Page(
      dark: false,
      coverScreenHeight: true,
      restrictScreenHeight: false,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(margin1size),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.code,
                      size: getH1Size(context),
                    ),
                    Container(
                      width: 32,
                    ),
                    Text(
                      "Projects",
                      style: getH1Style(context),
                    ),
                  ],
                ),
                Container(
                  height: margin1size,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        runSpacing: margin1size,
                        spacing: margin1size,
                        children: [
                          ProjectSection(
                            title: 'RGB LED',
                            image: 'res/RGBLed.png',
                            headerColor: Color.fromARGB(255, 0, 0, 100),
                          ),
                          ProjectSection(
                            title: 'Cardgame',
                            image: 'res/Cardgame.png',
                          ),
                          ProjectSection(
                            title: 'CleverConvert',
                            image: 'res/CleverConvert.png',
                            dark: false,
                            headerColor: Colors.greenAccent,
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
