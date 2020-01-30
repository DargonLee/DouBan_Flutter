import 'dart:async';
import 'package:douban/module/home/home_page.dart';
import 'package:douban/module/navigation_bar/navigation_bar.dart';
import 'package:douban/module/search/search_page.dart';
import 'package:flutter/material.dart';

// void main(){
//   FlutterError.onError = (FlutterErrorDetails details) {
//     print('flutter catch error:$details');
//   };
//   runZoned(
//     () => runApp(MyApp()),
//     onError: (Object obj, StackTrace stack) {
//       print('flutter catch error: obj: $obj \n stack:$stack');
//     }
//   );
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Map<String, WidgetBuilder> _routes() {
    return {
      '/search': (BuildContext context) => SearchPage(),
    };
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationBar(),
      routes: _routes(),
    );
  }
}
