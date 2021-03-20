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
    var text = [
      Text(
        "Hello and welcome to my website! I am a Computer Science student currently working on my master's degree with a great interest in Data Analytics and Machine learning.",
        style: textStyle,
      ),
    ];
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
                screenWidth > SWIDTH
                    ? Row(
                        children: text,
                      )
                    : Column(
                        children: text,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
