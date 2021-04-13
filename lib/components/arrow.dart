import 'package:flutter/material.dart';
import 'package:website/main.dart';

class Arrow extends StatefulWidget {
  final Function(BuildContext, int) scrollFunc;

  const Arrow({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);

  @override
  _ArrowState createState() => _ArrowState();
}

class _ArrowState extends State<Arrow> with TickerProviderStateMixin {
  late AnimationController arrowController;

  void initState() {
    super.initState();
    arrowController = AnimationController(
      vsync: this,
      duration: animationDuration * 2,
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
    var verticalMargin = getRelativeVerticalSize(context);
    var arrowSize = getRelativeVerticalSize(context);
    return GestureDetector(
      onTap: () => widget.scrollFunc(context, 1),
      child: Container(
        height: arrowSize + verticalMargin,
        child: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: arrowController.value * verticalMargin),
              child: Icon(
                Icons.keyboard_arrow_down_sharp,
                size: arrowSize,
                color: Theme.of(context).dividerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
