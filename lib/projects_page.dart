import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(minHeight: screenHeight),
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
            Wrap(
              children: [
                ProjectSection(
                  image: 'res/RGBLed.png',
                ),
                ProjectSection(
                  image: 'res/Cardgame.png',
                ),
                ProjectSection(
                  image: 'res/CleverConvert.png',
                ),
                ProjectSection(
                  image: 'res/ClojureAlgos.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectSection extends StatelessWidget {
  final String image;

  const ProjectSection({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: (screenWidth - 64) / 2,
      height: screenHeight / 1.5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 64),
        child: Material(
          elevation: 32,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            width: 750,
          ),
        ),
      ),
    );
  }
}
