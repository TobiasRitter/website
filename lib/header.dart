import 'package:flutter/material.dart';
import 'package:website/main.dart';

class Header extends StatelessWidget {
  final String text;
  final bool h2;
  final bool light;

  const Header({
    Key? key,
    required this.text,
    this.h2 = false,
    this.light = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var verticalMargin = getRelativeVerticalSize(context);
    var horizontalMargin = getRelativeHorizontalSize(context);
    return Padding(
      padding: EdgeInsets.only(top: h2 ? 0 : verticalMargin * 3),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MAX_CONTENT_WIDTH,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: h2 ? 0 : horizontalMargin),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: h2 ? verticalMargin * 1.5 : verticalMargin * 3,
                  child: FittedBox(
                    alignment: Alignment.topLeft,
                    child: SelectableText(
                      text,
                      style: h2
                          ? light
                              ? Theme.of(context).textTheme.headline2!.copyWith(
                                  color: Theme.of(context).canvasColor)
                              : Theme.of(context).textTheme.headline2
                          : light
                              ? Theme.of(context).textTheme.headline1!.copyWith(
                                  color: Theme.of(context).canvasColor)
                              : Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
