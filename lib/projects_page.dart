import 'package:flutter/material.dart';
import 'package:website/page.dart' as p;

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return p.Page(
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
    );
  }
}
