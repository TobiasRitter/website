import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/pages/landing_page.dart';

void launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

final Duration animationDuration = Duration(milliseconds: 500);

const MIN_DESKTOP_WIDTH = 1000.0;
const MIN_FOOTER_WIDTH = 560.0;
const MAX_CONTENT_WIDTH = 1200.0;
const IMG_OPACITY = 0.5;
const ELEVATION = 24.0;
const IMG_RADIUS = 24.0;

const TEXT = Colors.black;
const TEXT_LIGHT = const Color(0xff707070);
const PRIMARY_TEXT = Colors.white;
const PRIMARY_TEXT_LIGHT = const Color(0xfff0f0f0);

const PRIMARY = Colors.black;
const DIVIDER = Colors.black12;
const BACKGROUND = Colors.white;
const CANVAS = const Color(0xfff5f5f5);
const ACCENT = const Color(0xffff0060);
const SELECTION = const Color(0x44ff0060);
const SHADOW = const Color(0x55000000);

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
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ACCENT,
          selectionColor: SELECTION,
          selectionHandleColor: ACCENT,
        ),
        dividerColor: DIVIDER,
        canvasColor: CANVAS,
        accentColor: ACCENT,
        primaryColor: PRIMARY,
        backgroundColor: BACKGROUND,
        shadowColor: SHADOW,
        textTheme: TextTheme(
          bodyText2: GoogleFonts.roboto(
            height: 1.5,
            fontSize: 18,
            color: TEXT_LIGHT,
            fontWeight: FontWeight.normal,
          ),
          button: GoogleFonts.roboto(
            color: TEXT,
            fontWeight: FontWeight.bold,
          ),
          subtitle1: GoogleFonts.roboto(
            color: TEXT_LIGHT,
            fontWeight: FontWeight.normal,
          ),
          headline1: GoogleFonts.roboto(
            color: TEXT,
            fontWeight: FontWeight.w900,
          ),
          headline2: GoogleFonts.roboto(
            color: TEXT,
            fontWeight: FontWeight.bold,
          ),
        ),
        primaryTextTheme: TextTheme(
          bodyText2: GoogleFonts.roboto(
            height: 1.5,
            fontSize: 18,
            color: PRIMARY_TEXT_LIGHT,
            fontWeight: FontWeight.normal,
          ),
          button: GoogleFonts.roboto(
            color: PRIMARY_TEXT,
            fontWeight: FontWeight.bold,
          ),
          subtitle1: GoogleFonts.roboto(
            color: PRIMARY_TEXT_LIGHT,
            fontWeight: FontWeight.normal,
          ),
          headline1: GoogleFonts.roboto(
            color: PRIMARY_TEXT,
            fontWeight: FontWeight.w900,
          ),
          headline2: GoogleFonts.roboto(
            color: PRIMARY_TEXT,
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
          elevation: ELEVATION,
          hoverElevation: ELEVATION * 2,
          backgroundColor: ACCENT,
          shape: RoundedRectangleBorder(),
        ),
      ),
      home: LandingPage(),
    );
  }
}
