import 'package:flutter/material.dart';
import 'package:website/components/arrow.dart';
import 'package:website/main.dart';
import 'package:website/texts.dart';

class TitlePage extends StatefulWidget {
  final Function(BuildContext, int) scrollFunc;
  const TitlePage({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);

  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  late final Image img;

  @override
  void initState() {
    super.initState();
    img = Image.asset(
      "res/PBCompressed.png",
      fit: BoxFit.scaleDown,
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      child: isPortrait(context)
          ? buildMobileLayout(context)
          : buildDesktopLayout(context),
    );
  }

  Expanded buildMobileLayout(BuildContext context) {
    var horizontalMarginSize = getRelativeHorizontalSize(context);
    var verticalMarginSize = getRelativeVerticalSize(context);
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalMarginSize,
              verticalMarginSize * 3,
              horizontalMarginSize,
              verticalMarginSize,
            ),
            child: HeroContent(scrollFunc: widget.scrollFunc),
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                img,
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Arrow(
                      scrollFunc: widget.scrollFunc,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildDesktopLayout(BuildContext context) {
    var horizontalMarginSize = getRelativeHorizontalSize(context);
    var verticalMarginSize = getRelativeVerticalSize(context);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalMarginSize),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: img,
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalMarginSize,
                  vertical: verticalMarginSize,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: HeroContent(scrollFunc: widget.scrollFunc),
                    ),
                    Arrow(
                      scrollFunc: widget.scrollFunc,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroContent extends StatelessWidget {
  final Function(BuildContext, int) scrollFunc;

  const HeroContent({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var verticalMarginSize = getRelativeVerticalSize(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isPortrait(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: SelectableText(
            TITLE,
            style: Theme.of(context).textTheme.headline1,
            maxLines: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMarginSize / 2),
          child: FittedBox(
            child: SelectableText(
              SUBTITLE,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMarginSize / 2),
          child: FittedBox(
            child: Column(
              children: [
                SelectableText(
                  SHORT_DESC,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMarginSize),
          child: FloatingActionButton.extended(
            onPressed: () => scrollFunc(context, 3),
            label: Text("Get in contact"),
            icon: Icon(Icons.send),
          ),
        ),
      ],
    );
  }
}
