import 'package:douban/module/widgets/root_page.dart';
import 'package:flutter/material.dart';
import 'package:douban/widgetofweek/widget_map.dart';

class SafeAreaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RootPage(
      title: 'SafeArea',
      backroundColor: WidgetsMap.getRandomColor(),
      body: Container(
        child: Text('SafeArea'),
      ),
    );
  }
}
