import 'package:flutter/material.dart';
import 'package:website/components/animated_section.dart';
import 'package:website/main.dart';
import 'package:website/texts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var horizontalMargin = getRelativeHorizontalSize(context);
    var verticalMargin = getRelativeVerticalSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
              minHeight: screenHeight,
              maxWidth: screenWidth > MAX_CONTENT_WIDTH
                  ? MAX_CONTENT_WIDTH
                  : screenWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: verticalMargin * 3),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedSection(
                      key: Key('About'),
                      child: SelectableText(
                        ABOUT,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
