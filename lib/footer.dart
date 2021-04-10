import 'package:flutter/material.dart';
import 'package:website/copyright_button.dart';
import 'package:website/main.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var horizontalMargin = getHorizontalMargin(context);
    var verticalMargin = getVerticalMargin(context);
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalMargin, vertical: verticalMargin),
        child: isPortrait(context)
            ? buildMobileLayout(context)
            : buildDesktopLayout(context),
      ),
    );
  }

  Column buildMobileLayout(BuildContext context) {
    var verticalMargin = getVerticalMargin(context);
    return Column(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () =>
                    launchURL('https://www.linkedin.com/in/tobias-ritter/'),
                child: Text(
                  "LinkedIn",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: verticalMargin / 2),
                child: TextButton(
                  onPressed: () => launchURL(
                      'https://www.xing.com/profile/Tobias_Ritter52/cv'),
                  child: Text(
                    "XING",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: verticalMargin / 2),
                child: TextButton(
                  onPressed: () => launchURL(
                      'https://github.com/TobiasRitter?tab=repositories'),
                  child: Text(
                    "GitHub",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: verticalMargin / 2),
                child: TextButton(
                  onPressed: () =>
                      launchURL('https://hub.docker.com/u/tobiasritter'),
                  child: Text(
                    "Docker Hub",
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMargin),
          child: CopyrightButton(),
        ),
      ],
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    var horizontalMargin = getHorizontalMargin(context);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () =>
                  launchURL('https://www.linkedin.com/in/tobias-ritter/'),
              child: Text(
                "LinkedIn",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: horizontalMargin / 2),
              child: TextButton(
                onPressed: () => launchURL(
                    'https://www.xing.com/profile/Tobias_Ritter52/cv'),
                child: Text(
                  "XING",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: horizontalMargin / 2),
              child: TextButton(
                onPressed: () => launchURL(
                    'https://github.com/TobiasRitter?tab=repositories'),
                child: Text(
                  "GitHub",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: horizontalMargin / 2),
              child: TextButton(
                onPressed: () =>
                    launchURL('https://hub.docker.com/u/tobiasritter'),
                child: Text(
                  "Docker Hub",
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CopyrightButton(),
          ],
        ),
      ],
    );
  }
}
