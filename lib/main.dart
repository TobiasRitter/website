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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late ScrollController scrollController;
  late final TitlePage titlePage;
  late final MobileMenu menu;
  late final Column content;
  bool menuOpened = false;
  List<GlobalKey> keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  late Animation<double> iconAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      value: 1,
      vsync: this,
      duration: menuDuration,
    );
    iconAnimation = CurvedAnimation(
      curve: Curves.linear,
      parent: animationController,
    );
    scrollController = ScrollController();
    titlePage = TitlePage(
      key: keys[0],
      scrollFunc: scroll,
    );
    menu = MobileMenu(
      scrollFunc: scroll,
      closeFunc: closeDrawer,
    );
    content = Column(
      children: [
        AboutPage(
          key: keys[1],
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
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    animationController.dispose();
    super.dispose();
  }

  void closeDrawer() {
    animationController.forward();
    setState(() {
      menuOpened = false;
    });
  }

  void scroll(BuildContext context, int index) {
    var verticalMargin = getRelativeVerticalSize(context);
    double offset = isMobile(context) ? 48.0 + verticalMargin * 2 : 0;
    for (var key in keys.sublist(0, index)) {
      RenderObject? renderObject = key.currentContext!.findRenderObject();
      if (renderObject is RenderBox) {
        offset += renderObject.size.height;
      } else
        return;
    }
    scrollController.animateTo(offset,
        duration: scrollDuration, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    var horizontalMargin = getRelativeHorizontalSize(context);
    var verticalMargin = getRelativeVerticalSize(context);
    return Scaffold(
      body: Builder(
        builder: (context) => ScrollConfiguration(
          behavior: NoOverscrollBehaviour(),
          child: SingleChildScrollView(
            physics: menuOpened ? NeverScrollableScrollPhysics() : null,
            controller: scrollController,
            child: Column(
              children: [
                isMobile(context)
                    ? Container(
                        height: verticalMargin * 2 + 48,
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalMargin,
                            vertical: verticalMargin,
                          ),
                          child: IconButton(
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.close_menu,
                              progress: iconAnimation,
                            ),
                            onPressed: () {
                              menuOpened
                                  ? animationController.forward()
                                  : animationController.reverse();
                              setState(() => menuOpened = !menuOpened);
                            },
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      )
                    : Container(),
                isMobile(context)
                    ? AnimatedSwitcher(
                        duration: menuDuration,
                        child: menuOpened ? menu : titlePage,
                      )
                    : titlePage,
                content,
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
