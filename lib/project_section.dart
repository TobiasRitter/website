import 'dart:math';

import 'package:flutter/material.dart';
import 'package:website/main.dart';

class ProjectSection extends StatefulWidget {
  ProjectSection({
    Key? key,
    required this.title,
    required this.image,
    this.dark = true,
  }) : super(key: key);

  final String title;
  final String image;
  final bool dark;

  @override
  _ProjectSectionState createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _frontRotation;
  late Animation<double> _backRotation;
  bool isFrontVisible = true;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _frontRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: pi / 2)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
    _backRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: -pi / 2, end: 0.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var margin1size = getMargin1size(context);
    return Theme(
      data: widget.dark ? darkTheme : lightTheme,
      child: Builder(
        builder: (context) {
          return Stack(
            fit: StackFit.expand,
            children: [
              AnimatedCard(
                animation: _backRotation,
                child: Material(
                  elevation: 32,
                  child: Padding(
                    padding: EdgeInsets.all(margin1size),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: getH2size(context) + 16,
                            ),
                            Expanded(
                              child: Text(
                                widget.title,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: getH2Style(context),
                              ),
                            ),
                            IconButton(
                              iconSize: getH2size(context),
                              icon: Icon(Icons.close),
                              onPressed: _toggleSide,
                            ),
                          ],
                        ),
                        Text(
                          "Description",
                          style: getText1Style(context),
                        ),
                        FloatingActionButton.extended(
                          onPressed: null,
                          label: Text("Show on GitHub"),
                          icon: Icon(Icons.open_in_browser),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedCard(
                animation: _frontRotation,
                child: Material(
                  elevation: 32,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          widget.image,
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: Container(
                            color: widget.dark
                                ? darkTheme.canvasColor
                                : lightTheme.canvasColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(margin1size),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.title,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: getH2Style(context),
                                ),
                                Container(
                                  height: 32,
                                ),
                                FloatingActionButton.extended(
                                  onPressed: _toggleSide,
                                  icon: Icon(Icons.info_outline),
                                  label: Text("Learn more"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _toggleSide() {
    if (isFrontVisible) {
      controller.forward();
      isFrontVisible = false;
    } else {
      controller.reverse();
      isFrontVisible = true;
    }
  }
}

class AnimatedCard extends StatelessWidget {
  AnimatedCard({
    required this.child,
    required this.animation,
  });

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        var transform = Matrix4.identity();
        transform.setEntry(3, 2, 0.001);
        transform.rotateY(animation.value);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: child,
    );
  }
}
