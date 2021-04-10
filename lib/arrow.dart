import 'package:flutter/material.dart';
import 'package:website/main.dart';

class Arrow extends StatefulWidget {
  final Function(int) scrollFunc;

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
    return GestureDetector(
      onTap: () => widget.scrollFunc(1),
      child: Container(
        height: getArrowSize(context) + getHorizontalMargin(context),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: arrowController.value * getHorizontalMargin(context)),
              child: Icon(
                Icons.keyboard_arrow_down_sharp,
                size: getArrowSize(context),
                color: Theme.of(context).cardColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
