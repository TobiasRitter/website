import 'package:flutter/material.dart';
import 'package:website/header.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;
import 'package:website/title_text.dart';

class AboutPage extends StatelessWidget {
  final Function(int) scrollFunc;
  const AboutPage({
    Key? key,
    required this.scrollFunc,
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(scrollFunc: scrollFunc),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(marginSize, 0, marginSize, marginSize),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(marginSize),
                      child: Text(
                        "My name is Tobias Ritter and I am a Computer Science student currently working on my master's degree. I am highly interested in Data Analytics and Machine learning and love to develop Flutter applications like this website in my free time.",
                        style: textStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
