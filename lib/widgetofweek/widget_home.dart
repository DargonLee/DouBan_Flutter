import 'package:douban/module/widgets/root_page.dart';
import 'package:flutter/material.dart';
class WidgetHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RootPage(
      title: '组件',
      hasLeading: false,
      body: Container(
        child: Center(
          child: Text('WidgetHomePage'),
        ),
      ),
    );
  }
}
