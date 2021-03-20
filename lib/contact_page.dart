import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:website/header.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var marginSize = getMarginSize(context);
    return p.Page(
      themeData: darkTheme,
      coverScreenHeight: false,
      restrictScreenHeight: false,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(marginSize),
            child: Column(
              children: [
                Header(
                  icon: Icons.alternate_email,
                  text: "Contact",
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Wrap(
                      runSpacing: marginSize,
                      children: [
                        Container(
                          width: screenWidth > SWIDTH
                              ? (screenWidth - 128) / 2
                              : screenWidth - 128,
                          child: ContactSection(
                            text: "Let's get to know each other:",
                            buttons: [
                              TextButton(
                                onPressed: () => launchURL(
                                    'https://www.linkedin.com/in/tobias-ritter/'),
                                child: Text(
                                  "LinkedIn",
                                ),
                              ),
                              TextButton(
                                onPressed: () => launchURL(
                                    'https://www.xing.com/profile/Tobias_Ritter52/cv'),
                                child: Text(
                                  "XING",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth > SWIDTH
                              ? (screenWidth - 128) / 2
                              : screenWidth - 128,
                          child: ContactSection(
                            text: "Take a look at my code here:",
                            buttons: [
                              TextButton(
                                onPressed: () => launchURL(
                                    'https://github.com/TobiasRitter?tab=repositories'),
                                child: Text(
                                  "GitHub",
                                ),
                              ),
                              TextButton(
                                onPressed: () => launchURL(
                                    'https://hub.docker.com/u/tobiasritter'),
                                child: Text(
                                  "Docker Hub",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

class ContactSection extends StatelessWidget {
  final String text;
  final List<TextButton> buttons;

  const ContactSection({
    Key? key,
    required this.text,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: marginSize,
      runSpacing: marginSize / 2,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle.copyWith(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        Wrap(
          children: buttons,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: marginSize / 2,
          runSpacing: marginSize / 2,
        ),
      ],
    );
  }
}
