import 'package:douban/module/model/douban_model.dart';
import 'package:douban/module/widgets/root_page.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final DoubanCategory category;

  CategoryPage({
    Key key,
    this.category
  });
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: DoubanModel.getMoreTitles(widget.category).length);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RootPage(
      title: DoubanModel.getDoubanTitle(widget.category),
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
    for(int i = 0; i < DoubanModel.getMoreTitles(widget.category).length; i++) {
      tabs.add(Text(DoubanModel.getMoreTitles(widget.category)[i]));
    }
    return tabs;
  }

  List<Widget> _tabViews() {
    List<Widget> tabs = List();
    for(int i = 0; i < DoubanModel.getMoreTitles(widget.category).length; i++) {
      tabs.add(Text(DoubanModel.getMoreTitles(widget.category)[i]));
    }
    return tabs;
  }
}