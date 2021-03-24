import 'package:flutter/material.dart';
import 'package:website/copyright_button.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    return p.Page(
      dark: true,
      coverScreenHeight: false,
      child: Padding(
        padding: EdgeInsets.all(marginSize),
        child: screenWidth > SWIDTH
            ? buildDesktopLayout(context)
            : buildMobileLayout(context),
      ),
    );
  }

  Column buildMobileLayout(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Wrap(
                    children: [
                      Container(
                        width: 150,
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () => launchURL(
                                  'https://www.linkedin.com/in/tobias-ritter/'),
                              child: Text(
                                "LinkedIn",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Row(
                          children: [
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
                    ],
                  ),
                  Wrap(
                    children: [
                      Container(
                        width: 150,
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () => launchURL(
                                  'https://github.com/TobiasRitter?tab=repositories'),
                              child: Text(
                                "GitHub",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Row(
                          children: [
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
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: marginSize),
          child: Container(
            width: 150,
            child: CopyrightButton(),
          ),
        ),
      ],
    );
  }

  Row buildDesktopLayout(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Row(
      children: [
        Container(
          width: 200,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () =>
                    launchURL('https://www.linkedin.com/in/tobias-ritter/'),
                child: Text(
                  "LinkedIn",
                ),
              ),
              Container(width: marginSize / 2),
              TextButton(
                onPressed: () => launchURL(
                    'https://www.xing.com/profile/Tobias_Ritter52/cv'),
                child: Text(
                  "XING",
                ),
              ),
              Container(width: marginSize / 2),
              TextButton(
                onPressed: () => launchURL(
                    'https://github.com/TobiasRitter?tab=repositories'),
                child: Text(
                  "GitHub",
                ),
              ),
              Container(width: marginSize / 2),
              TextButton(
                onPressed: () =>
                    launchURL('https://hub.docker.com/u/tobiasritter'),
                child: Text(
                  "Docker Hub",
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          child: CopyrightButton(),
        ),
      ],
    );
  }
}
