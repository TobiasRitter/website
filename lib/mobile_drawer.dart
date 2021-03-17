import 'package:flutter/material.dart';
import 'package:website/logo.dart';
import 'package:website/main.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginSize = getMarginSize(context);
    return Theme(
      data: darkTheme,
      child: Builder(
        builder: (context) {
          return Container(
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: EdgeInsets.all(marginSize),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Logo(),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.school,
                          size: getButtonStyle(context).fontSize,
                          color: Theme.of(context).primaryColor,
                        ),
                        label: Text(
                          "resume",
                          style: getButtonStyle(context),
                        ),
                      ),
                      Container(
                        width: marginSize,
                      ),
                      TextButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.code,
                          size: getButtonStyle(context).fontSize,
                          color: Theme.of(context).primaryColor,
                        ),
                        label: Text(
                          "projects",
                          style: getButtonStyle(context),
                        ),
                      ),
                      Container(
                        width: marginSize,
                      ),
                      TextButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.alternate_email,
                          size: getButtonStyle(context).fontSize,
                          color: Theme.of(context).primaryColor,
                        ),
                        label: Text(
                          "contact",
                          style: getButtonStyle(context),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
