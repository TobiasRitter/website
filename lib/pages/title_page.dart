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
  late final Widget img;

  @override
  void initState() {
    super.initState();
    img = Image.asset(
      "res/PBFaded.png",
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

  Widget buildMobileLayout(BuildContext context) {
    var horizontalMarginSize = getRelativeHorizontalSize(context);
    var verticalMarginSize = getRelativeVerticalSize(context);
    return Column(
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
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    var horizontalMarginSize = getRelativeHorizontalSize(context);
    var verticalMarginSize = getRelativeVerticalSize(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMarginSize),
      child: Stack(
        children: [
          Row(
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
                  child: HeroContent(scrollFunc: widget.scrollFunc),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: verticalMarginSize),
                    child: Arrow(
                      scrollFunc: widget.scrollFunc,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
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
        Row(
          children: [
            Expanded(
              child: FittedBox(
                child: SelectableText(
                  TITLE,
                  style: Theme.of(context).textTheme.headline1,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMarginSize / 2),
          child: SelectableText(
            isPortrait(context) ? SHORT_DESC_MOBILE : SHORT_DESC,
            textAlign: isPortrait(context) ? TextAlign.center : TextAlign.start,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: verticalMarginSize),
          child: isPortrait(context)
              ? FloatingActionButton.extended(
                  onPressed: () {},
                  icon: Icon(Icons.download),
                  label: Text("Resume"),
                )
              : Row(
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {},
                      icon: Icon(Icons.download),
                      label: Text("Resume"),
                    ),
                    Container(width: 32),
                    IconButton(
                      onPressed: () => scrollFunc(context, 2),
                      icon: Icon(Icons.code),
                    ),
                    Container(width: 32),
                    IconButton(
                      onPressed: () => scrollFunc(context, 3),
                      icon: Icon(Icons.send),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
