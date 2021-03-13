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
    var margin1size = getMargin1size(context);
    return p.Page(
      dark: false,
      coverScreenHeight: true,
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
                      size: getH1size(context),
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
                  height: 32,
                ),
                GridView.count(
                  mainAxisSpacing: margin1size,
                  crossAxisSpacing: margin1size,
                  shrinkWrap: true,
                  childAspectRatio: 1.5,
                  crossAxisCount: screenWidth > SWIDTH ? 2 : 1,
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
              ],
            ),
          );
        },
      ),
    );
  }
}
