import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:website/pages/about_page.dart';
import 'package:website/components/footer.dart';
import 'package:website/components/mobile_menu.dart';
import 'package:website/pages/projects_page.dart';
import 'package:website/pages/resume_page.dart';
import 'package:website/pages/title_page.dart';
import 'package:website/main.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
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
      duration: animationDuration,
    );
    iconAnimation = CurvedAnimation(
      curve: Curves.linear,
      parent: animationController,
    );
    scrollController = ScrollController();
    menu = MobileMenu(
      scrollFunc: closeAndScroll,
    );
    content = Column(
      children: [
        TitlePage(
          key: keys[0],
          scrollFunc: scroll,
        ),
        // AboutPage(
        //   key: keys[1],
        // ),
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

  Future<void> closeDrawer() async {
    setState(() {
      menuOpened = false;
    });
    await animationController.forward();
  }

  Future<void> closeAndScroll(int index) async {
    await closeDrawer();
    scroll(this.context, index);
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
        duration: animationDuration, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => ScrollConfiguration(
          behavior: NoOverscrollBehaviour(),
          child: AnimateIfVisibleWrapper(
            child: SingleChildScrollView(
              physics: menuOpened ? NeverScrollableScrollPhysics() : null,
              controller: scrollController,
              child: content,
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
