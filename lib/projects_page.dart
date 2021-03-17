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
    var marginSize = getMarginSize(context);
    return p.Page(
      dark: false,
      coverScreenHeight: true,
      restrictScreenHeight: false,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(marginSize),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: marginSize),
                  child: Row(
                    children: [
                      Icon(
                        Icons.code,
                        size: getH1Style(context).fontSize,
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
                ),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        runSpacing: marginSize,
                        spacing: marginSize,
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
