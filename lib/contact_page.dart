import 'package:flutter/material.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    return p.Page(
      themeData: darkTheme,
      coverScreenHeight: false,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(marginSize),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Wrap(
                      runSpacing: marginSize,
                      spacing: marginSize,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () => launchURL(
                                  'https://www.linkedin.com/in/tobias-ritter/'),
                              child: Text(
                                "LinkedIn",
                              ),
                            ),
                            Container(
                              width: marginSize,
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () => launchURL(
                                  'https://github.com/TobiasRitter?tab=repositories'),
                              child: Text(
                                "GitHub",
                              ),
                            ),
                            Container(
                              width: marginSize,
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
