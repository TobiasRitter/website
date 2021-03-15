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
    var margin1size = getMargin1size(context);
    return p.Page(
      dark: true,
      coverScreenHeight: false,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(margin1size),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.alternate_email,
                      size: getH1size(context),
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
                Container(
                  height: margin1size,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Wrap(
                      runSpacing: margin1size,
                      children: [
                        Container(
                          width: screenWidth > SWIDTH
                              ? (screenWidth - 128) / 2
                              : screenWidth - 128,
                          child: ContactSection(
                            text: "Let's get to know each other:",
                            buttons: [
                              FloatingActionButton.extended(
                                onPressed: null,
                                label: Text(
                                  "LinkedIn",
                                ),
                              ),
                              FloatingActionButton.extended(
                                onPressed: null,
                                label: Text("XING"),
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
                              FloatingActionButton.extended(
                                onPressed: null,
                                label: Text(
                                  "GitHub",
                                ),
                              ),
                              FloatingActionButton.extended(
                                onPressed: null,
                                label: Text("Docker Hub"),
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
  final List<FloatingActionButton> buttons;

  const ContactSection({
    Key? key,
    required this.text,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var margin1size = getMargin1size(context);
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: margin1size,
      runSpacing: margin1size / 2,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: getText1Style(context),
        ),
        Wrap(
          children: buttons,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: margin1size / 2,
          runSpacing: margin1size / 2,
        ),
      ],
    );
  }
}
