import 'package:flutter/material.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return p.Page(
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
                    size: 96,
                  ),
                  Container(
                    width: 32,
                  ),
                  Text(
                    "Projects",
                    style: TextStyle(
                      fontSize: 96,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 32,
            ),
            Expanded(
              child: GridView.count(
                childAspectRatio: 1.5,
                mainAxisSpacing: 32,
                crossAxisSpacing: 32,
                crossAxisCount: 2,
                children: [
                  ProjectSection(
                    image: 'res/RGBLed.png',
                  ),
                  ProjectSection(
                    image: 'res/Cardgame.png',
                  ),
                  ProjectSection(
                    image: 'res/CleverConvert.png',
                    dark: false,
                  ),
                  ProjectSection(
                    image: 'res/ClojureAlgos.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectSection extends StatefulWidget {
  final String image;
  final bool dark;

  const ProjectSection({
    Key? key,
    required this.image,
    this.dark = true,
  }) : super(key: key);

  @override
  _ProjectSectionState createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      child: Theme(
        data: widget.dark ? darkTheme : lightTheme,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.image,
                ),
              ),
            ),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Container(
                    color: widget.dark
                        ? darkTheme.canvasColor
                        : lightTheme.canvasColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 64,
                      ),
                      Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 64,
                        ),
                      ),
                      IconButton(
                        iconSize: 64,
                        icon: Icon(Icons.info_outline),
                        onPressed: () => setState(() => expanded = !expanded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
