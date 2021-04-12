import 'package:flutter/material.dart';
import 'package:website/copyright_button.dart';
import 'package:website/main.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var horizontalMargin = getRelativeHorizontalSize(context);
    var verticalMargin = getRelativeVerticalSize(context);
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalMargin, vertical: verticalMargin),
        child: isMobile(context)
            ? buildMobileLayout(context)
            : buildDesktopLayout(context),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    var verticalMargin = getRelativeVerticalSize(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalMargin * 2),
      child: Column(
        children: [
          Center(
            child: isPortrait(context)
                ? buildFooterCol(context)
                : buildFooterRow(context),
          ),
          Padding(
            padding: EdgeInsets.only(top: verticalMargin * 2),
            child: CopyrightButton(),
          ),
        ],
      ),
    );
  }

  Column buildFooterCol(BuildContext context) {
    var verticalMargin = getRelativeVerticalSize(context);
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
        Padding(
          padding: EdgeInsets.only(top: verticalMargin / 2),
          child: TextButton(
            onPressed: () =>
                launchURL('https://www.xing.com/profile/Tobias_Ritter52/cv'),
            child: Text(
              "XING",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMargin / 2),
          child: TextButton(
            onPressed: () =>
                launchURL('https://github.com/TobiasRitter?tab=repositories'),
            child: Text(
              "GitHub",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMargin / 2),
          child: TextButton(
            onPressed: () => launchURL('https://hub.docker.com/u/tobiasritter'),
            child: Text(
              "Docker Hub",
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        buildFooterRow(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CopyrightButton(),
          ],
        ),
      ],
    );
  }

  Row buildFooterRow(BuildContext context) {
    var horizontalMargin = getRelativeHorizontalSize(context);
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
        Padding(
          padding: EdgeInsets.only(left: horizontalMargin / 2),
          child: TextButton(
            onPressed: () =>
                launchURL('https://www.xing.com/profile/Tobias_Ritter52/cv'),
            child: Text(
              "XING",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: horizontalMargin / 2),
          child: TextButton(
            onPressed: () =>
                launchURL('https://github.com/TobiasRitter?tab=repositories'),
            child: Text(
              "GitHub",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: horizontalMargin / 2),
          child: TextButton(
            onPressed: () => launchURL('https://hub.docker.com/u/tobiasritter'),
            child: Text(
              "Docker Hub",
            ),
          ),
        ),
      ],
    );
  }
}
