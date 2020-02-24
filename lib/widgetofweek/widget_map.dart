import 'package:douban/widgetofweek/safe_area.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class WidgetsMap {
  Map<String, dynamic> _widget = {
    'SafeArea': SafeAreaWidget(),
  };

  dynamic getWidgetWithTitle(String title) {
    return _widget[title];
  }

  static getRandomColor() {
    return Color.fromARGB(255, Random.secure().nextInt(255),
        Random.secure().nextInt(255), Random.secure().nextInt(255));
  }
}
