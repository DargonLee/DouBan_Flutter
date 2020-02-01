import 'package:douban/module/category/category__detail_item.dart';
import 'package:douban/module/model/douban_model.dart';
import 'package:douban/module/widgets/root_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  int _itemCount = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: DoubanModel.getMoreTitles(widget.category).length);
  }

  void _onLoading () {
    Future.delayed(Duration(seconds: 2), () {
      _itemCount += 5;
      _refreshController.refreshCompleted();
      setState(() {
        
      });
    });
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

  List<Widget>  _tabViews() {
    List<Widget> tabs = List();
    for(int i = 0; i < DoubanModel.getMoreTitles(widget.category).length; i++) {
      tabs.add(_categoryList());
    }
    return tabs;
  }

  Widget _categoryList() {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: _refreshController,
      onLoading: _onLoading,
      child: ListView.separated(
        itemBuilder: _buildItem,
        separatorBuilder: (BuildContext context, int index) {
          return Container(height: 21,);
        }, 
        itemCount: _itemCount
      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            return Container();
          }else if (mode == LoadStatus.loading) {
            return CupertinoActivityIndicator();
          }else if (mode == LoadStatus.failed) {
            body = Text('Loading failed');
          }else if (mode == LoadStatus.canLoading) {
            body = Text('Release to load'); 
          }else {
            body = Text('No more data');
          }
          return Container(
            height: 55,
            child: Center(
              child: body,
            ),
          );
        }
      ),
    );
  }

  Widget _buildItem (BuildContext context, int index) {
    return CategoryDetailItem();
  }
}