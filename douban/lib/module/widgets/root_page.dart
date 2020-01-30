import 'package:douban/module/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  final String title;
  final bool  hasLeading;
  final TabBar tabBar;
  final Widget body;
  final Color backroundColor;

  RootPage({
    Key key,
    this.title,
    this.hasLeading = true,
    this.tabBar,
    this.body,
    this.backroundColor = const Color(0xFF33c9FF)
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: title != null ? AppBar(
        backgroundColor: this.backroundColor,
        leading: hasLeading? Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ) : null,
        title: Text(
          title,
          style: TextStyle(fontSize: 26, )
        ),
        bottom: tabBar,
      ) : null,
      body: body,
    );
  }
}