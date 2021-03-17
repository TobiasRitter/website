import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
      dark: true,
      coverScreenHeight: false,
      restrictScreenHeight: false,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(marginSize),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: marginSize),
                  child: Row(
                    children: [
                      Icon(
                        Icons.alternate_email,
                        size: getH1Style(context).fontSize,
                      ),
                      Container(
                        width: 32,
                      ),
                      Text(
                        "Contact",
                        style: getH1Style(context),
                      ),
                    ],
                  ),
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
                                onPressed: () {},
                                child: AutoSizeText(
                                  "LinkedIn",
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: AutoSizeText(
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
                                onPressed: () {},
                                child: AutoSizeText(
                                  "GitHub",
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: AutoSizeText(
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
        AutoSizeText(
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
