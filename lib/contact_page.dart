import 'package:flutter/material.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var margin1size = getMargin1size(context);
    return p.Page(
      dark: true,
      coverScreenHeight: false,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(margin1size),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.alternate_email,
                      size: getH1size(context),
                    ),
                    Container(
                      width: 32,
                    ),
                    Text(
                      "Contact",
                      style: getH1Style(context),
                    ),
                  ],
                ),
                Container(
                  height: margin1size,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Wrap(
                      children: [
                        Container(
                          width: screenWidth > SWIDTH
                              ? (screenWidth - 128) / 2
                              : screenWidth - 128,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Let's get to know each other:",
                                textAlign: TextAlign.center,
                                style: getText1Style(context),
                              ),
                              Container(
                                width: margin1size,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton.extended(
                                    onPressed: null,
                                    label: Text(
                                      "LinkedIn",
                                    ),
                                  ),
                                  Container(
                                    width: 32,
                                  ),
                                  FloatingActionButton.extended(
                                    onPressed: null,
                                    label: Text("XING"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth > SWIDTH
                              ? (screenWidth - 128) / 2
                              : screenWidth - 128,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Take a look at my code here:",
                                textAlign: TextAlign.center,
                                style: getText1Style(context),
                              ),
                              Container(
                                width: margin1size,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton.extended(
                                    onPressed: null,
                                    label: Text("GitHub"),
                                  ),
                                  Container(
                                    width: 32,
                                  ),
                                  FloatingActionButton.extended(
                                    onPressed: null,
                                    label: Text("Docker Hub"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
