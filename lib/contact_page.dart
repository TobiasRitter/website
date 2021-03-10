import 'package:flutter/material.dart';
import 'package:website/page.dart' as p;

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return p.Page(
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
    );
  }
}
