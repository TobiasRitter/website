import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:website/header.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var marginSize = getMarginSize(context);
    return p.Page(
      themeData: lightTheme,
      coverScreenHeight: true,
      restrictScreenHeight: false,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(marginSize),
            child: Column(
              children: [
                Header(
                  icon: Icons.person,
                  text: "About",
                ),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: marginSize,
                        runSpacing: marginSize,
                        children: [
                          Container(
                            width: screenWidth > SWIDTH
                                ? (screenWidth - 3 * marginSize) / 3
                                : screenWidth - 2 * marginSize,
                            child: Padding(
                              padding: EdgeInsets.all(marginSize),
                              child: Column(
                                children: [
                                  Container(
                                    width: screenWidth,
                                    child: FittedBox(
                                      child: Text(
                                        "Hello,",
                                        style: titleStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: screenWidth > SWIDTH
                                ? (screenWidth - 3 * marginSize) * 2 / 3
                                : screenWidth - 2 * marginSize,
                            child: Padding(
                              padding: EdgeInsets.all(marginSize),
                              child: Column(
                                children: [
                                  Text(
                                    "my name is Tobias Ritter and I am happy You visit my website! I am a Computer Science student currently working on my master's degree with a great interest in Data Analytics and Machine learning.",
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
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
