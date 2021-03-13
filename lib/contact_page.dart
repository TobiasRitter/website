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
    return p.Page(
      dark: true,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(64),
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
                  height: 64,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Wrap(
                      children: [
                        Container(
                          width: screenWidth > 800
                              ? (screenWidth - 128) / 2
                              : screenWidth - 128,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Want to know more about me?",
                                textAlign: TextAlign.center,
                                style: getH2Style(context),
                              ),
                              Container(
                                height: 64,
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
                              Container(
                                height: 64,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth > 800
                              ? (screenWidth - 128) / 2
                              : screenWidth - 128,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Interested in some actual code?",
                                textAlign: TextAlign.center,
                                style: getH2Style(context),
                              ),
                              Container(
                                height: 64,
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
                              Container(
                                height: 64,
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
