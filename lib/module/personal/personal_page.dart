import 'package:douban/module/model/douban_model.dart';
import 'package:douban/module/widgets/root_page.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<PersonalPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: DoubanModel.getPersonalTitles().length);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RootPage(
      title: '喜欢',
      hasLeading: false,
      tabBar: _tabbar(),
      body: TabBarView(
        controller: _tabController,
        children: _tabViews(),
      ),
    );
  }

  Widget _tabbar() {
    return TabBar(
      controller: _tabController,
      unselectedLabelColor: Colors.white,
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      labelPadding: EdgeInsets.only(bottom: 8),
      tabs: _tabs(),
    );
  }

  List<Widget> _tabs() {
    List<Widget> tabs = List();
    for(int i = 0; i < DoubanModel.getPersonalTitles().length; i++) {
      tabs.add(Text(DoubanModel.getPersonalTitles()[i]));
    }
    return tabs;
  }

  List<Widget> _tabViews() {
    List<Widget> tabs = List();
    for(int i = 0; i < DoubanModel.getPersonalTitles().length; i++) {
      tabs.add(Text(DoubanModel.getPersonalTitles()[i]));
    }
    return tabs;
  }
}