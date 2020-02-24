import 'package:douban/module/widgets/root_page.dart';
import 'package:flutter/material.dart';
import 'package:douban/widgetofweek/widget_map.dart';


class WidgetHomePage extends StatefulWidget {
  WidgetHomePage({Key key}) : super(key: key);

  @override
  _WidgetHomePageState createState() => _WidgetHomePageState();
}

class _WidgetHomePageState extends State<WidgetHomePage> {

  void _onTapItem(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WidgetsMap().getWidgetWithTitle(title);
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RootPage(
        title: '组件',
        hasLeading: false,
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 1.5),
          children: <Widget>[
            _buildItems('SafeArea', Icon(Icons.ac_unit)),
            _buildItems('Expanded', Icon(Icons.airport_shuttle)),
            _buildItems('Wrap', Icon(Icons.all_inclusive)),
            _buildItems('Animated', Icon(Icons.beach_access)),
            _buildItems('Opacity', Icon(Icons.cake)),
            _buildItems('FutureBuilder', Icon(Icons.free_breakfast)),
          ],
        ));
  }

  Widget _buildItems(String title, Widget icon) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: GestureDetector(
        onTap: () {
          _onTapItem(title);
        },
        child: Column(
          children: <Widget>[
            icon,
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
