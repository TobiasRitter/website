import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  canvasColor: Colors.black,
  accentColor: Colors.white,
);
final ThemeData lightTheme = ThemeData(
  accentColor: Colors.black,
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
        body: ListView(
      children: [
        Page(
          child: Row(
            children: [
              Image.asset("res/ProfilePicture.png"),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tobias Ritter",
                      style: TextStyle(
                        fontSize: 128,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 64,
                    ),
                    Text(
                      "I am a Computer Science student currently working on my master degree",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Container(
                      height: 64,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Page(
          dark: true,
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: Scaffold(
              body: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.school,
                        size: 128,
                      ),
                      Container(
                        width: 32,
                      ),
                      Text(
                        "Resume",
                        style: TextStyle(
                          fontSize: 96,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: null,
                label: Text("Download"),
                icon: Icon(Icons.download_sharp),
              ),
            ),
          ),
        ),
        Page(
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: Scaffold(
              body: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.code,
                        size: 96,
                      ),
                      Container(
                        width: 32,
                      ),
                      Text(
                        "Projects",
                        style: TextStyle(
                          fontSize: 96,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Page(
          dark: true,
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: Scaffold(
              body: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.alternate_email,
                        size: 96,
                      ),
                      Container(
                        width: 32,
                      ),
                      Text(
                        "Contact",
                        style: TextStyle(
                          fontSize: 96,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class Page extends StatelessWidget {
  final Widget child;
  final bool dark;

  const Page({
    Key? key,
    required this.child,
    this.dark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Theme(
      data: dark ? darkTheme : lightTheme,
      child: Container(
        height: height,
        child: Scaffold(
          body: child,
        ),
      ),
    );
  }
}
