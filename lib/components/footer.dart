import 'package:flutter/material.dart';
import 'package:website/components/copyright_button.dart';
import 'package:website/main.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isMobile(context)
          ? isPortrait(context)
              ? buildMobileLayout(context)
              : buildMobileLayout2(context)
          : buildDesktopLayout(context),
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    var horizontalMargin = getRelativeHorizontalSize(context);
    var verticalMargin = getRelativeVerticalSize(context);
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalMargin * 3,
          horizontal: horizontalMargin,
        ),
        child: Column(
          children: [
            TextButton(
              onPressed: () =>
                  launchURL('https://www.linkedin.com/in/tobias-ritter/'),
              child: Text(
                "LinkedIn",
              ),
            ),
            TextButton(
              onPressed: () =>
                  launchURL('https://www.xing.com/profile/Tobias_Ritter52/cv'),
              child: Text(
                "XING",
              ),
            ),
            TextButton(
              onPressed: () =>
                  launchURL('https://github.com/TobiasRitter?tab=repositories'),
              child: Text(
                "GitHub",
              ),
            ),
            TextButton(
              onPressed: () =>
                  launchURL('https://hub.docker.com/u/tobiasritter'),
              child: Text(
                "Docker Hub",
              ),
            ),
            CopyrightButton(),
          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout2(BuildContext context) {
    var horizontalMargin = getRelativeHorizontalSize(context);
    var verticalMargin = getRelativeVerticalSize(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalMargin,
        horizontal: horizontalMargin,
      ),
      child: Column(
        children: [
          Center(
            child: buildFooterRow(context),
          ),
          Padding(
            padding: EdgeInsets.only(top: verticalMargin / 2),
            child: CopyrightButton(),
          ),
        ],
      ),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    var horizontalMargin = getRelativeHorizontalSize(context);
    var verticalMargin = getRelativeVerticalSize(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalMargin,
        horizontal: horizontalMargin,
      ),
      child: Stack(
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
      ),
    );
  }

  Row buildFooterRow(BuildContext context) {
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
          padding: const EdgeInsets.only(left: 32),
          child: TextButton(
            onPressed: () =>
                launchURL('https://www.xing.com/profile/Tobias_Ritter52/cv'),
            child: Text(
              "XING",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: TextButton(
            onPressed: () =>
                launchURL('https://github.com/TobiasRitter?tab=repositories'),
            child: Text(
              "GitHub",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32),
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
