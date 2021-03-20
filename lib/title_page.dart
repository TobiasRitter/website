import 'package:flutter/material.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

class TitlePage extends StatefulWidget {
  final Function(int) scrollFunc;
  const TitlePage({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);

  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> with TickerProviderStateMixin {
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
    return p.Page(
      themeData: lightTheme,
      coverScreenHeight: false,
      restrictScreenHeight: true,
      builder: Builder(
        builder: (context) {
          return Container(
            color: Colors.grey.shade100,
            child: Image.asset(
              "res/ProfilePictureSquared.png",
              fit: BoxFit.scaleDown,
              alignment: Alignment.bottomCenter,
            ),
          );
        },
      ),
    );
  }

//   Padding buildText(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var marginSize = getMarginSize(context);
//     return Padding(
//       padding: EdgeInsets.all(marginSize),
//       child: Column(
//         children: [
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: screenWidth,
//                   child: FittedBox(
//                     child: Text(
//                       "Tobias Ritter",
//                       style: titleStyle.copyWith(
//                         color: Theme.of(context).primaryColor,
//                       ),
//                       maxLines: 1,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: screenWidth,
//                   child: FittedBox(
//                     child: Text(
//                       "Computer Science Student & Developer",
//                       style: subtitleStyle.copyWith(
//                         color: Theme.of(context).primaryColor,
//                       ),
//                       maxLines: 1,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: marginSize),
//                   child: Row(
//                     children: [
//                       TextButton.icon(
//                         onPressed: () => widget.scrollFunc(2),
//                         icon: Icon(Icons.school),
//                         label: Text("resume"),
//                       ),
//                       Text(
//                         " or ",
//                         style: textStyle.copyWith(
//                           color: Theme.of(context).primaryColor,
//                         ),
//                       ),
//                       TextButton.icon(
//                         onPressed: () => widget.scrollFunc(4),
//                         icon: Icon(Icons.alternate_email),
//                         label: Text("contact"),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           GestureDetector(
//             onTap: () => widget.scrollFunc(1),
//             child: Container(
//               height: getArrowSize(context) + getMarginSize(context),
//               child: Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(
//                         top: arrowController.value * getMarginSize(context)),
//                     child: Icon(
//                       Icons.keyboard_arrow_down_rounded,
//                       size: getArrowSize(context),
//                       color: Theme.of(context).primaryColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
}
