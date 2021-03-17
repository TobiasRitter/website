import 'dart:math';

import 'package:flutter/material.dart';
import 'package:website/contact_page.dart';
import 'package:website/projects_page.dart';
import 'package:website/resume_page.dart';
import 'package:website/title_page.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  canvasColor: Colors.black,
  accentColor: Colors.indigoAccent,
  primaryColor: Colors.white,
);
final ThemeData lightTheme = ThemeData(
  canvasColor: Colors.white,
  accentColor: Colors.indigoAccent,
  primaryColor: Colors.black,
);

final Duration animationDuration = Duration(milliseconds: 500);
final Duration arrowAnimationDuration = Duration(milliseconds: 1000);

const SWIDTH = 1500;
// TODO: layout between 1200 and 500

TextStyle getTitleStyle(BuildContext context) {
  return TextStyle(
    fontSize: getRelativeSize(context, 128),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).accentColor,
  );
}

TextStyle getSubtitleStyle(BuildContext context) {
  return TextStyle(
    fontSize: getRelativeSize(context, 32),
    fontWeight: FontWeight.normal,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getTextStyle(BuildContext context) {
  return TextStyle(
    fontSize: getRelativeSize(context, 18),
    fontWeight: FontWeight.normal,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getH1Style(BuildContext context) {
  return TextStyle(
    fontSize: getRelativeSize(context, 64),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getH2Style(BuildContext context) {
  return TextStyle(
    fontSize: getRelativeSize(context, 32),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getLogoStyle(BuildContext context) {
  return TextStyle(
    fontSize: getRelativeSize(context, 48),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getSubLogoStyle(BuildContext context) {
  return TextStyle(
    fontSize: getRelativeSize(context, 16),
    fontWeight: FontWeight.normal,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getButtonStyle(BuildContext context) {
  return TextStyle(
    fontSize: getRelativeSize(context, 24),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).primaryColor,
  );
}

TextStyle getFabStyle(BuildContext context) {
  return TextStyle(
    fontSize: getRelativeSize(context, 16),
    fontWeight: FontWeight.normal,
    color: Theme.of(context).primaryColor,
  );
}

TextStyle getAccentButtonStyle(BuildContext context) {
  return TextStyle(
    fontSize: getRelativeSize(context, 24),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).accentColor,
  );
}

double getRelativeSize(BuildContext context, double referenceSize) {
  var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;
  if (screenWidth > SWIDTH) {
    return referenceSize;
  } else {
    return min(screenWidth, screenHeight) * referenceSize / 800;
  }
}

double getArrowSize(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > SWIDTH) {
    return 128;
  } else {
    return screenWidth * 0.16;
  }
}

double getMarginSize(BuildContext context) => getRelativeSize(context, 64);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("res/ProfilePicture.png"), context);
    return MaterialApp(
      title: 'Tobias Ritter',
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      theme: lightTheme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController = ScrollController();
  List<GlobalKey> keys = [GlobalKey(), GlobalKey(), GlobalKey(), GlobalKey()];

  void scroll(int index) {
    double offset = 0.0;
    for (var key in keys.sublist(0, index)) {
      RenderObject? renderObject = key.currentContext!.findRenderObject();
      if (renderObject is RenderBox) {
        offset += renderObject.size.height;
      } else
        return;
    }
    scrollController.animateTo(offset,
        duration: animationDuration, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            TitlePage(
              key: keys[0],
              scrollFunc: scroll,
            ),
            ResumePage(
              key: keys[1],
            ),
            ProjectsPage(
              key: keys[2],
            ),
            ContactPage(
              key: keys[3],
            ),
          ],
        ),
      ),
    );
  }
}
