import 'package:flutter/material.dart';
import 'package:website/header.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

class AboutPage extends StatelessWidget {
  final Function(int) scrollFunc;
  const AboutPage({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    return p.Page(
      coverScreenHeight: true,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: marginSize * 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: screenWidth > MWIDTH ? MWIDTH : screenWidth),
              child: Padding(
                padding: EdgeInsets.all(marginSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      text: "Hello,",
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "My name is Tobias Ritter and I am a Computer Science student currently working on my master's degree at the Technical University of Munich. I am highly interested in Data Analytics and Machine learning and love to develop Flutter applications like this website in my free time. During my bachelor studies in cooperation with TRUMPF GmbH + Co. KG I had the chance to gather insights into multiple areas of software development. I gained experience with programming languages lik Python, Java, C, and C\# and worked with common Data Analytics frameworks like numpy, pandas and scikit-learn.\n\nDuring the winter, I love skiing in the Alps. If you want to learn more about my resume or are interested into my side projects, just scroll further down the page.",
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
