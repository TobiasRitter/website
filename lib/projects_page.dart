import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:website/header.dart';
import 'package:website/project_section.dart';
import 'package:website/main.dart';
import 'package:website/page.dart' as p;

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    return p.Page(
      themeData: lightTheme,
      coverScreenHeight: true,
      restrictScreenHeight: false,
      builder: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(marginSize),
            child: Column(
              children: [
                Header(
                  icon: Icons.code,
                  text: "Projects",
                ),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        runSpacing: marginSize,
                        spacing: marginSize,
                        children: [
                          ProjectSection(
                            title: 'PyNN',
                            url: 'https://github.com/TobiasRitter/PyNN',
                            description:
                                'This project aims to implement a fully functional Multi-Layer Perceptron in Python. The project points out the fundamental concepts of Artifical Neural Networks, such as forward and backward propagation.',
                            image: 'res/PyNN.png',
                            dark: true,
                            headerColor: Colors.white,
                          ),
                          ProjectSection(
                            title: 'RGB LED',
                            url:
                                'https://github.com/TobiasRitter/flutter_rgb_leds',
                            description:
                                'This Flutter application in combination with a Raspberry Pi allows You to control Adafruit RGB LEDs with Your smartphone. This requires your smartphone and the Raspberry Pi to be in the same local network.',
                            image: 'res/RGBLed.png',
                            headerColor: Colors.redAccent,
                          ),
                          ProjectSection(
                            title: 'Cardgame',
                            url: 'https://github.com/TobiasRitter/Cardgame',
                            description:
                                'This project allows you to host a card game running on the web that can be played with 2 or more friends. The goal of the game is to get rid of all your cards by putting cards of higher rank on top of the card stack.',
                            image: 'res/Cardgame.png',
                            dark: true,
                            headerColor: Colors.blueAccent,
                          ),
                          ProjectSection(
                            title: 'CleverConvert',
                            url:
                                'https://github.com/TobiasRitter/cleverconvert',
                            description:
                                'This application lets you comfortably convert values into all common units. The project relies on Flutter and Dart.',
                            image: 'res/CleverConvert.png',
                            headerColor: Colors.greenAccent,
                          ),
                          ProjectSection(
                            title: 'Data Mining Algorithms',
                            url:
                                'https://github.com/TobiasRitter/Data-Mining-Algorithms',
                            description:
                                'This project contains supervised and unsupervised Data Mining algorithms implemented in Clojure.',
                            image: 'res/ClojureAlgos.png',
                            headerColor: Color.fromARGB(255, 30, 30, 30),
                          ),
                        ],
                      ),
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
