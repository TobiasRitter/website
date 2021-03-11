import 'package:flutter/material.dart';
import 'package:website/contact_page.dart';
import 'package:website/projects_page.dart';
import 'package:website/resume_page.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  canvasColor: Colors.black,
  accentColor: Colors.white,
);
final ThemeData lightTheme = ThemeData(
  accentColor: Colors.black,
);

final textStyle1 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w100,
);

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
          // TitlePage(),
          ProjectsPage(),
          ResumePage(),
          ContactPage(),
        ],
      ),
    ));
  }
}
