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
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(horizontalMargin),
        child: screenWidth > SWIDTH
            ? buildDesktopLayout(context)
            : buildMobileLayout(context),
      ),
    );
  }

  Column buildMobileLayout(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var horizontalMargin = getHorizontalMargin(context);
    return Column(
      children: [
        screenWidth > 4 * FOOTER_BUTTON_WIDTH + 5 * horizontalMargin
            ? buildFooterRow(context)
            : buildFooterColumn(context),
        Padding(
          padding: EdgeInsets.only(top: horizontalMargin),
          child: Container(
            width: FOOTER_BUTTON_WIDTH,
            child: CopyrightButton(),
          ),
        ),
      ],
    );
  }

  Row buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Container(
          width: FOOTER_BUTTON_WIDTH,
        ),
        Expanded(
          child: buildFooterRow(context),
        ),
        Container(
          width: FOOTER_BUTTON_WIDTH,
          child: CopyrightButton(),
        ),
      ],
    );
  }

  Column buildFooterColumn(BuildContext context) {
    var horizontalMargin = getHorizontalMargin(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () =>
              launchURL('https://www.linkedin.com/in/tobias-ritter/'),
          child: Text(
            "LinkedIn",
          ),
        ),
        Container(height: horizontalMargin / 2),
        TextButton(
          onPressed: () =>
              launchURL('https://www.xing.com/profile/Tobias_Ritter52/cv'),
          child: Text(
            "XING",
          ),
        ),
        Container(height: horizontalMargin / 2),
        TextButton(
          onPressed: () =>
              launchURL('https://github.com/TobiasRitter?tab=repositories'),
          child: Text(
            "GitHub",
          ),
        ),
        Container(height: horizontalMargin / 2),
        TextButton(
          onPressed: () => launchURL('https://hub.docker.com/u/tobiasritter'),
          child: Text(
            "Docker Hub",
          ),
        ),
      ],
    );
  }

  Row buildFooterRow(BuildContext context) {
    var horizontalMargin = getHorizontalMargin(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () =>
              launchURL('https://www.linkedin.com/in/tobias-ritter/'),
          child: Text(
            "LinkedIn",
          ),
        ),
        Container(width: horizontalMargin / 2),
        TextButton(
          onPressed: () =>
              launchURL('https://www.xing.com/profile/Tobias_Ritter52/cv'),
          child: Text(
            "XING",
          ),
        ),
        Container(width: horizontalMargin / 2),
        TextButton(
          onPressed: () =>
              launchURL('https://github.com/TobiasRitter?tab=repositories'),
          child: Text(
            "GitHub",
          ),
        ),
        Container(width: horizontalMargin / 2),
        TextButton(
          onPressed: () => launchURL('https://hub.docker.com/u/tobiasritter'),
          child: Text(
            "Docker Hub",
          ),
        ),
      ],
    );
  }
}
