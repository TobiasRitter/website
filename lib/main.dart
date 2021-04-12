import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/about_page.dart';
import 'package:website/footer.dart';
import 'package:website/mobile_menu.dart';
import 'package:website/projects_page.dart';
import 'package:website/resume_page.dart';
import 'package:website/title_page.dart';

void launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

final Duration animationDuration = Duration(milliseconds: 500);
final Duration arrowAnimationDuration = Duration(milliseconds: 1000);
final Duration drawerCloseDuration = Duration(milliseconds: 300);

const MIN_DESKTOP_WIDTH = 1000.0;
const MIN_FOOTER_WIDTH = 560.0;
const MAX_CONTENT_WIDTH = 1200.0;
const IMG_OPACITY = 0.5;

const PRIMARY = Colors.black;
const CANVAS = Colors.white;
const CARD = const Color(0xfff5f5f5);
const BACKGROUND = const Color(0xff000030);
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
        canvasColor: CANVAS,
        accentColor: ACCENT,
        primaryColor: PRIMARY,
        cardColor: CARD,
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
            primary: ACCENT,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ACCENT,
          shape: RoundedRectangleBorder(),
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
      endDrawerEnableOpenDragGesture: false,
      endDrawer: isMobile(context)
          ? MobileMenu(
              scrollFunc: scroll,
            )
          : null,
      body: SafeArea(
        child: ScrollConfiguration(
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
                Footer(
                  key: keys[4],
                ),
              ],
            ),
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
