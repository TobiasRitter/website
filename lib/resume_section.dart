import 'package:flutter/material.dart';
import 'package:website/hover_button.dart';
import 'package:website/main.dart';

class ResumeSection extends StatefulWidget {
  final String title;
  final String date;
  final String institution;
  final String location;
  final String description;
  final String institutionUrl;
  final String? image;
  final IconData icon;

  const ResumeSection({
    Key? key,
    required this.title,
    required this.date,
    required this.institution,
    required this.location,
    required this.description,
    required this.institutionUrl,
    required this.icon,
    this.image,
  }) : super(key: key);

  @override
  _ResumeSectionState createState() => _ResumeSectionState();
}

class _ResumeSectionState extends State<ResumeSection> {
  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(minHeight: screenHeight),
      decoration: widget.image != null
          ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image!),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(IMG_OPACITY), BlendMode.darken),
                fit: BoxFit.cover,
              ),
            )
          : null,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
              minHeight: screenHeight,
              maxWidth:
                  screenWidth > CONTENT_WIDTH ? CONTENT_WIDTH : screenWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              screenWidth > SWIDTH
                  ? buildDesktopLayout(context, marginSize)
                  : buildMobileLayout(context, marginSize),
            ],
          ),
        ),
      ),
    );
  }

  Column buildMobileLayout(BuildContext context, double marginSize) {
    return Column(
      children: [
        buildInfo(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: marginSize),
          child: buildDescription(context),
        ),
      ],
    );
  }

  Widget buildDesktopLayout(BuildContext context, double marginSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: buildInfo(context),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: marginSize),
            child: buildDescription(context),
          ),
        ),
      ],
    );
  }

  Widget buildDescription(BuildContext context) {
    return SelectableText(
      widget.description,
      style: widget.image != null
          ? Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Theme.of(context).canvasColor)
          : null,
    );
  }

  Widget buildInfo(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            widget.title,
            style: widget.image != null
                ? Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Theme.of(context).canvasColor)
                : Theme.of(context).textTheme.headline3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_sharp,
                  color: widget.image != null
                      ? Theme.of(context).canvasColor
                      : null,
                ),
                Container(width: 16),
                SelectableText(
                  widget.date,
                  style: widget.image != null
                      ? Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Theme.of(context).canvasColor)
                      : null,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_sharp,
                  color: widget.image != null
                      ? Theme.of(context).canvasColor
                      : null,
                ),
                Container(width: 16),
                SelectableText(
                  widget.location,
                  style: widget.image != null
                      ? Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Theme.of(context).canvasColor)
                      : null,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: HoverButton(
              onPressed: () => launchURL(widget.institutionUrl),
              text: widget.institution,
              light: widget.image != null,
            ),
          ),
        ],
      ),
    );
  }
}

class CircleSection extends StatelessWidget {
  final bool light;

  const CircleSection({
    Key? key,
    this.light = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: BORDER_OPACITY,
      child: Container(
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all(
            width: 4,
            color: light
                ? Theme.of(context).canvasColor
                : Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
