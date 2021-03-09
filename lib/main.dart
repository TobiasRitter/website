import 'package:flutter/material.dart';

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
        accentColor: Colors.black,
      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(32),
                          child: TextButton.icon(
                            label: Text(
                              "Resume",
                              style: TextStyle(fontSize: 24),
                            ),
                            icon: Icon(
                              Icons.school,
                              size: 32,
                            ),
                            onPressed: null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(32),
                          child: TextButton.icon(
                            label: Text(
                              "Projects",
                              style: TextStyle(fontSize: 24),
                            ),
                            icon: Icon(
                              Icons.code,
                              size: 32,
                            ),
                            onPressed: null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(32),
                          child: TextButton.icon(
                            label: Text(
                              "Contact",
                              style: TextStyle(fontSize: 24),
                            ),
                            icon: Icon(
                              Icons.alternate_email,
                              size: 32,
                            ),
                            onPressed: null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Page(
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: Scaffold(
              floatingActionButton: FloatingActionButton.extended(
                onPressed: null,
                label: Text("Download"),
                icon: Icon(Icons.download_sharp),
              ),
            ),
          ),
        ),
        Page(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Page(
          child: Container(
            color: Colors.yellow,
          ),
        ),
      ],
    ));
  }
}

class Page extends StatelessWidget {
  final Widget child;

  const Page({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      child: child,
    );
  }
}
