import 'package:flutter/material.dart';
import 'package:website/page.dart' as p;

class TitlePage extends StatefulWidget {
  const TitlePage({
    Key? key,
  }) : super(key: key);

  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> with TickerProviderStateMixin {
  late AnimationController controller;

  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 64,
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textStyle1 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w100,
    );
    return p.Page(
      child: Row(
        children: [
          Image.asset("res/ProfilePicture.png"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 192,
                  ),
                  Text(
                    "Tobias Ritter",
                    style: TextStyle(
                      fontSize: 156,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 64,
                  ),
                  Container(
                    width: 840,
                    child: Text(
                      "I am a Computer Science student currently working on a master's degree and especially interested in Data Analytics and Machine Learning.",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ),
                  Container(
                    height: 64,
                  ),
                  Container(
                    width: 840,
                    child: Wrap(
                      spacing: 8,
                      children: [
                        Text("Take", style: textStyle1),
                        Text("a", style: textStyle1),
                        Text("look", style: textStyle1),
                        Text("at", style: textStyle1),
                        Text("my", style: textStyle1),
                        Container(
                          width: 120,
                          child: Row(
                            children: [
                              TextButton.icon(
                                onPressed: null,
                                icon: Icon(Icons.school),
                                label: Text(
                                  "resume",
                                  style: textStyle1,
                                ),
                              ),
                              Text(",", style: textStyle1),
                            ],
                          ),
                        ),
                        Text("go", style: textStyle1),
                        Text("through", style: textStyle1),
                        Text("my", style: textStyle1),
                        Text("side", style: textStyle1),
                        Container(
                          width: 120,
                          child: Row(
                            children: [
                              TextButton.icon(
                                onPressed: null,
                                icon: Icon(Icons.code),
                                label: Text(
                                  "projects",
                                  style: textStyle1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("or", style: textStyle1),
                        Text("learn", style: textStyle1),
                        Text("how", style: textStyle1),
                        Text("to", style: textStyle1),
                        Text("get", style: textStyle1),
                        Text("in", style: textStyle1),
                        Container(
                          width: 120,
                          child: Row(
                            children: [
                              TextButton.icon(
                                onPressed: null,
                                icon: Icon(Icons.alternate_email),
                                label: Text(
                                  "contact",
                                  style: textStyle1,
                                ),
                              ),
                              Text(".", style: textStyle1),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 64,
                  ),
                  Container(
                    height: 192,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: controller.value),
                          child: Opacity(
                            opacity: 0.15,
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 128,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
