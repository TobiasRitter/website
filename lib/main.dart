import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/about_page.dart';
import 'package:website/contact_page.dart';
import 'package:website/projects_page.dart';
import 'package:website/resume_page.dart';
import 'package:website/title_page.dart';

void launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  canvasColor: Colors.white,
  accentColor: Colors.indigoAccent,
  primaryColor: Colors.black,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.indigoAccent,
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

final menuButtonStyle = TextButton.styleFrom(
  primary: Colors.black,
);

final TextStyle h1Style = TextStyle(
  fontSize: 64,
  fontWeight: FontWeight.bold,
);

final TextStyle h2Style = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
);

final TextStyle h3Style = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

final TextStyle titleStyle = TextStyle(
  fontWeight: FontWeight.bold,
);

final TextStyle subtitleStyle = TextStyle(
  fontWeight: FontWeight.normal,
);

final TextStyle textStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
);

final Duration animationDuration = Duration(milliseconds: 500);
final Duration arrowAnimationDuration = Duration(milliseconds: 1000);

const SWIDTH = 1500.0;
const MWIDTH = 1000.0;
const MWIDTH2 = 800.0;

double getRelativeSize(BuildContext context, double referenceSize) {
  var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;
  if (screenWidth > SWIDTH) {
    return referenceSize;
  } else {
    return min(screenWidth, screenHeight) * referenceSize / 800;
  }
}

double getArrowSize(BuildContext context) => getRelativeSize(context, 128);

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
      theme: ThemeData(
        canvasColor: Colors.white,
        accentColor: Colors.black,
        primaryColor: Colors.black,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.black,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController = ScrollController();
  List<GlobalKey> keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

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
            AboutPage(
              key: keys[1],
              scrollFunc: scroll,
            ),
            ResumePage(
              key: keys[2],
            ),
            ProjectsPage(
              key: keys[3],
            ),
            ContactPage(
              key: keys[4],
            ),
          ],
        ),
      ),
    );
  }
}
