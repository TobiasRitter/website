import 'package:flutter/material.dart';
import 'package:website/main.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          GridView.count(
            shrinkWrap: true,
            childAspectRatio: 1.5,
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
          Container(
            height: 32,
          ),
        ],
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
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Material(
        elevation: 32,
        child: Theme(
          data: widget.dark ? darkTheme : lightTheme,
          child: Scaffold(
            body: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: expanded
                  ? Padding(
                      padding: const EdgeInsets.all(64),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                              ),
                              Text(
                                "Title",
                                style: TextStyle(
                                  fontSize: 64,
                                ),
                              ),
                              IconButton(
                                  iconSize: 64,
                                  icon: Icon(Icons.close),
                                  onPressed: () =>
                                      setState(() => expanded = false))
                            ],
                          ),
                          Text(
                            "Description",
                            style: textStyle1,
                          ),
                          FloatingActionButton.extended(
                            onPressed: null,
                            label: Text("Show on GitHub"),
                            icon: Icon(Icons.open_in_browser),
                          )
                        ],
                      ),
                    )
                  : Container(
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
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Title",
                                    style: TextStyle(
                                      fontSize: 64,
                                    ),
                                  ),
                                  Container(
                                    height: 32,
                                  ),
                                  FloatingActionButton.extended(
                                    onPressed: () =>
                                        setState(() => expanded = true),
                                    icon: Icon(Icons.info_outline),
                                    label: Text("Learn more"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
