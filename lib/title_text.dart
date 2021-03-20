import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:website/main.dart';

class TitleText extends StatefulWidget {
  final Function(int) scrollFunc;

  const TitleText({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);
  @override
  _TitleTextState createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> with TickerProviderStateMixin {
  late AnimationController arrowController;

  void initState() {
    super.initState();
    arrowController = AnimationController(
      vsync: this,
      duration: arrowAnimationDuration,
      lowerBound: 0,
      upperBound: 1,
    );
    arrowController.addListener(() {
      setState(() {});
    });

    arrowController.repeat(reverse: true);
  }

  void dispose() {
    arrowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var marginSize = getMarginSize(context);
    return Container(
      constraints: BoxConstraints(
          minHeight:
              screenWidth > SWIDTH ? screenHeight / 3 : screenHeight / 2),
      child: Padding(
        padding: EdgeInsets.all(marginSize),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: marginSize),
          child: Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: marginSize,
                  runSpacing: marginSize,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: screenWidth > SWIDTH
                      ? WrapAlignment.spaceBetween
                      : WrapAlignment.center,
                  children: [
                    AutoSizeText(
                      "Welcome to my website!",
                      maxLines: 1,
                      style: h1Style,
                    ),
                    screenWidth > SWIDTH
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton.icon(
                                onPressed: () => widget.scrollFunc(2),
                                icon: Icon(Icons.school),
                                label: Text("resume"),
                              ),
                              Container(
                                width: marginSize / 2,
                              ),
                              TextButton.icon(
                                onPressed: () => widget.scrollFunc(3),
                                icon: Icon(Icons.code),
                                label: Text("projects"),
                              ),
                              Container(
                                width: marginSize / 2,
                              ),
                              FloatingActionButton.extended(
                                onPressed: () => widget.scrollFunc(4),
                                icon: Icon(Icons.alternate_email),
                                label: Text("contact"),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => widget.scrollFunc(2),
                                icon: Icon(Icons.school),
                              ),
                              Container(
                                width: marginSize / 2,
                              ),
                              IconButton(
                                onPressed: () => widget.scrollFunc(2),
                                icon: Icon(Icons.code),
                              ),
                              Container(
                                width: marginSize / 2,
                              ),
                              FloatingActionButton(
                                onPressed: () => widget.scrollFunc(4),
                                child: Icon(Icons.alternate_email),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
