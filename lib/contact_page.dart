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
      dark: true,
      coverScreenHeight: false,
      child: Padding(
        padding: EdgeInsets.all(marginSize),
        child: Row(
          children: [
            Expanded(
              child: Wrap(
                spacing: marginSize,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
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
                        width: marginSize,
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
                        width: marginSize,
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
      ),
    );
  }
}
