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

const SWIDTH = 1200;
// TODO: layout between 1200 and 500

TextStyle getTitleStyle(BuildContext context) {
  return TextStyle(
    fontSize: getTitleSize(context),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).accentColor,
  );
}

TextStyle getSubtitleStyle(BuildContext context) {
  return TextStyle(
    fontSize: getSubtitleSize(context),
    fontWeight: FontWeight.normal,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getTextStyle(BuildContext context) {
  return TextStyle(
    fontSize: getTextSize(context),
    fontWeight: FontWeight.normal,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getH1Style(BuildContext context) {
  return TextStyle(
    fontSize: getH1Size(context),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getH2Style(BuildContext context) {
  return TextStyle(
    fontSize: getH2Size(context),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getLogoStyle(BuildContext context) {
  return TextStyle(
    fontSize: getLogoSize(context),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getSubLogoStyle(BuildContext context) {
  return TextStyle(
    fontSize: getSubLogoSize(context),
    fontWeight: FontWeight.normal,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getButtonStyle(BuildContext context) {
  return TextStyle(
    fontSize: getButtonSize(context),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).primaryColor,
  );
}

TextStyle getAccentButtonStyle(BuildContext context) {
  return TextStyle(
    fontSize: getButtonSize(context),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).accentColor,
  );
}

double getTitleSize(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > SWIDTH) {
    return 128;
  } else {
    return screenWidth * 0.16;
  }
}

double getSubtitleSize(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > SWIDTH) {
    return 32;
  } else {
    return screenWidth * 0.04;
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

double getArrowOffset(BuildContext context) {
  var screenHeight = MediaQuery.of(context).size.height;
  if (screenHeight > SWIDTH) {
    return 64;
  } else {
    return screenHeight * 0.08;
  }
}

double getH1Size(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > SWIDTH) {
    return 64;
  } else {
    return screenWidth * 0.08;
  }
}

double getH2Size(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > SWIDTH) {
    return 32;
  } else {
    return screenWidth * 0.04;
  }
}

double getLogoSize(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > SWIDTH) {
    return 48;
  } else {
    return screenWidth * 0.06;
  }
}

double getSubLogoSize(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > SWIDTH) {
    return 16;
  } else {
    return screenWidth * 0.02;
  }
}

double getTextSize(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > SWIDTH) {
    return 18;
  } else {
    return screenWidth * 0.025;
  }
}

double getButtonSize(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > SWIDTH) {
    return 24;
  } else {
    return screenWidth * 0.03;
  }
}

double getMarginSize(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > SWIDTH) {
    return 64;
  } else {
    return screenWidth * 0.08;
  }
}

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
