import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/pages/landing_page.dart';

void launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

final Duration scrollDuration = Duration(milliseconds: 500);
final Duration arrowAnimationDuration = Duration(milliseconds: 1000);
final Duration menuDuration = Duration(milliseconds: 300);

const MIN_DESKTOP_WIDTH = 1000.0;
const MIN_FOOTER_WIDTH = 560.0;
const MAX_CONTENT_WIDTH = 1200.0;
const IMG_OPACITY = 0.5;
const IMG_ELEVATION = 24.0;

const PRIMARY = Colors.black;
const PRIMARY_LIGHT = Colors.black12;
const BACKGROUND = Colors.white;
const CANVAS = const Color(0xfff5f5f5);
const ACCENT = const Color(0xffff0050);

double getRelativeHorizontalSize(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  return screenWidth / 20;
}

double getRelativeVerticalSize(BuildContext context) {
  var screenHeight = MediaQuery.of(context).size.height;
  return screenHeight / 20;
}

bool isPortrait(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return size.width < size.height || size.width < MIN_FOOTER_WIDTH;
}

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < MIN_DESKTOP_WIDTH;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tobias Ritter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerColor: PRIMARY_LIGHT,
        canvasColor: CANVAS,
        accentColor: ACCENT,
        primaryColor: PRIMARY,
        backgroundColor: BACKGROUND,
        textTheme: TextTheme(
          bodyText2: GoogleFonts.roboto(
            height: 1.5,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          button: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
          ),
          subtitle1: GoogleFonts.roboto(
            fontWeight: FontWeight.w100,
          ),
          headline1: GoogleFonts.roboto(
            color: PRIMARY,
            fontWeight: FontWeight.w900,
          ),
          headline2: GoogleFonts.roboto(
            color: PRIMARY,
            fontWeight: FontWeight.bold,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            primary: PRIMARY,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ACCENT,
          shape: RoundedRectangleBorder(),
        ),
      ),
      home: LandingPage(),
    );
  }
}
