import 'package:flutter/material.dart';
import 'package:website/components/animated_section.dart';
import 'package:website/main.dart';

class MobileMenu extends StatelessWidget {
  final Function(BuildContext, int) scrollFunc;

  const MobileMenu({
    Key? key,
    required this.scrollFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var horizontalMargin = getRelativeHorizontalSize(context);
    var verticalMargin = getRelativeVerticalSize(context);
    return Container(
      height: screenHeight - (verticalMargin * 2 + 48),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: (verticalMargin * 2 + 48),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalMargin,
            vertical: verticalMargin,
          ),
          child: Column(
            children: [
              Expanded(
                child: AnimatedSection(
                  key: Key('Menu'),
                  child: isPortrait(context)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => scrollFunc(context, 2),
                              child: Text("Resume"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 32),
                              child: TextButton(
                                onPressed: () => scrollFunc(context, 3),
                                child: Text("Projects"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 32),
                              child: FloatingActionButton.extended(
                                onPressed: () => scrollFunc(context, 4),
                                label: Text("Contact"),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => scrollFunc(context, 2),
                              child: Text("Resume"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 32),
                              child: TextButton(
                                onPressed: () => scrollFunc(context, 3),
                                child: Text("Projects"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 32),
                              child: FloatingActionButton.extended(
                                onPressed: () => scrollFunc(context, 4),
                                label: Text("Contact"),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
