import 'package:flutter/material.dart';
import 'package:website/contact_page.dart';
import 'package:website/projects_page.dart';
import 'package:website/resume_page.dart';
import 'package:website/title_page.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  canvasColor: Colors.black,
  accentColor: Colors.white,
);
final ThemeData lightTheme = ThemeData(
  accentColor: Colors.black,
);

TextStyle getTitle1Style(BuildContext context) {
  return TextStyle(
    fontSize: getTitle1size(context),
    fontWeight: FontWeight.bold,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getSubtitle1Style(BuildContext context) {
  return TextStyle(
    fontSize: getSubtitle1size(context),
    fontWeight: FontWeight.normal,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getText1Style(BuildContext context) {
  return TextStyle(
    fontSize: getText1size(context),
    fontWeight: FontWeight.w100,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getText2Style(BuildContext context) {
  return TextStyle(
    fontSize: getText2size(context),
    fontWeight: FontWeight.w100,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getH1Style(BuildContext context) {
  return TextStyle(
    fontSize: getH1size(context),
    fontWeight: FontWeight.w100,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getH2Style(BuildContext context) {
  return TextStyle(
    fontSize: getH2size(context),
    fontWeight: FontWeight.w100,
    color: Theme.of(context).textTheme.bodyText1!.color,
  );
}

TextStyle getButton1Style(BuildContext context) {
  return TextStyle(
    fontSize: getButton1size(context),
    fontWeight: FontWeight.w100,
  );
}

double getTitle1size(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > 800) {
    return 156;
  } else {
    return 78;
  }
}

double getSubtitle1size(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > 800) {
    return 32;
  } else {
    return 16;
  }
}

double getH1size(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > 800) {
    return 96;
  } else {
    return 32;
  }
}

double getH2size(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > 800) {
    return 48;
  } else {
    return 24;
  }
}

double getText1size(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > 800) {
    return 24;
  } else {
    return 12;
  }
}

double getText2size(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > 800) {
    return 20;
  } else {
    return 10;
  }
}

double getButton1size(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > 800) {
    return 24;
  } else {
    return 12;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TitlePage(),
          ResumePage(),
          ProjectsPage(),
          ContactPage(),
        ],
      ),
    ));
  }
}
