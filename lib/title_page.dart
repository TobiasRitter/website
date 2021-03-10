import 'package:flutter/material.dart';
import 'package:website/page.dart' as p;

class TitlePage extends StatelessWidget {
  const TitlePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    "I am a Computer Science student currently working on a master's degree and especially interested in Data Analytics and Machine Learning.",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 64,
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
