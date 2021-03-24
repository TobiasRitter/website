import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/about_page.dart';
import 'package:website/contact_page.dart';
import 'package:website/mobile_menu.dart';
import 'package:website/projects_page.dart';
import 'package:website/resume_page.dart';
import 'package:website/title_page.dart';

void launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

final Duration animationDuration = Duration(milliseconds: 500);
final Duration arrowAnimationDuration = Duration(milliseconds: 1000);
final Duration drawerCloseDuration = Duration(milliseconds: 300);

const SWIDTH = 1000.0;
const CONTENT_WIDTH = 1000.0;
const OPACITY = 0.15;

double getRelativeSize(BuildContext context, double referenceSize) {
  var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;
  if (screenWidth > SWIDTH) {
    return referenceSize;
  } else {
    return min(screenWidth, screenHeight) * referenceSize / 800;
  }
}

double getArrowSize(BuildContext context) => getRelativeSize(context, 64);

double getMarginSize(BuildContext context) => getRelativeSize(context, 64);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Tobias Ritter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white,
        accentColor: Colors.black,
        primaryColor: Colors.black,
        cardColor: Colors.grey.shade100,
        textTheme: TextTheme(
          bodyText2: GoogleFonts.roboto(
            height: 1.5,
            fontSize: screenWidth > SWIDTH ? 18 : 16,
            fontWeight: FontWeight.w300,
          ),
          headline6: GoogleFonts.bebasNeue(
            fontSize: 128,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
          subtitle2: GoogleFonts.roboto(
            fontSize: 48,
            fontWeight: FontWeight.w100,
          ),
          headline1: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 64,
            fontWeight: FontWeight.w900,
          ),
          headline2: GoogleFonts.roboto(
            color: Colors.black87,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headline3: GoogleFonts.roboto(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            primary: Colors.black,
            textStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            primary: Colors.black,
            side: BorderSide(
              color: Colors.black,
              width: 3,
            ),
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
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      endDrawer: screenWidth > SWIDTH
          ? null
          : MobileMenu(
              scrollFunc: scroll,
            ),
      body: ScrollConfiguration(
        behavior: NoOverscrollBehaviour(),
        child: SingleChildScrollView(
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
      ),
    );
  }
}

class NoOverscrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
