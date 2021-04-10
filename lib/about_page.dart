import 'package:flutter/material.dart';
import 'package:website/header.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;
import 'package:website/texts.dart';

class AboutPage extends StatelessWidget {
  final Function(int) scrollFunc;
  const AboutPage({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var horizontalMargin = getHorizontalMargin(context);
    var verticalMargin = getVerticalMargin(context);
    var screenWidth = MediaQuery.of(context).size.width;
    return p.Page(
      coverScreenHeight: true,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalMargin * 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: screenWidth > MAX_CONTENT_WIDTH
                      ? MAX_CONTENT_WIDTH
                      : screenWidth),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      text: "Hello",
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SelectableText(
                            ABOUT,
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
