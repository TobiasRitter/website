import 'package:flutter/material.dart';
import 'package:website/main.dart';

class ResumeSection extends StatefulWidget {
  final String title;
  final String date;
  final String institution;
  final String location;
  final String description;
  final String institutionUrl;
  final String? image;
  final Widget? header;
  final bool dark;

  const ResumeSection({
    Key? key,
    required this.title,
    required this.date,
    required this.institution,
    required this.location,
    required this.description,
    required this.institutionUrl,
    this.image,
    this.header,
    this.dark = false,
  }) : super(key: key);

  @override
  _ResumeSectionState createState() => _ResumeSectionState();
}

class _ResumeSectionState extends State<ResumeSection> {
  @override
  Widget build(BuildContext context) {
    var horizontalMargin = getHorizontalMargin(context);
    var verticalMargin = getVerticalMargin(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: widget.image != null
          ? null
          : widget.dark
              ? Theme.of(context).cardColor
              : Theme.of(context).canvasColor,
      constraints: BoxConstraints(minHeight: screenHeight),
      decoration: widget.image != null
          ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image!),
                colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor.withOpacity(IMG_OPACITY),
                    BlendMode.darken),
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
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: verticalMargin * 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.header ?? Container(),
                Center(
                  child: screenWidth > SWIDTH
                      ? buildDesktopLayout(context)
                      : buildMobileLayout(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildMobileLayout(BuildContext context) {
    var horizontalMargin = getHorizontalMargin(context);
    var verticalMargin = getVerticalMargin(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
          child: buildInfo(context),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              horizontalMargin, verticalMargin * 2, horizontalMargin, 0),
          child: buildDescription(context),
        ),
      ],
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    var horizontalMargin = getHorizontalMargin(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
                child: buildInfo(context),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
                child: buildDescription(context),
              ),
            ),
          ],
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
    return Column(
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
          padding: EdgeInsets.only(top: 32),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_sharp,
                color:
                    widget.image != null ? Theme.of(context).canvasColor : null,
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
          padding: EdgeInsets.only(top: 16),
          child: Row(
            children: [
              Icon(
                Icons.location_on_sharp,
                color:
                    widget.image != null ? Theme.of(context).canvasColor : null,
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
          padding: EdgeInsets.only(top: 32),
          child: FloatingActionButton.extended(
            onPressed: () => launchURL(widget.institutionUrl),
            label: Text(widget.institution),
          ),
        ),
      ],
    );
  }
}
