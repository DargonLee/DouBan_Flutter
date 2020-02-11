import 'package:douban/module/category/category__detail_item.dart';
import 'package:douban/module/category/category_data_source.dart';
import 'package:douban/module/model/douban_model.dart';
import 'package:douban/module/widgets/root_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryPage extends StatefulWidget {
  final DoubanCategory category;

  CategoryPage({Key key, this.category});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  CategoryDataSource _categoryDataSource;
  int _currentTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initDataSource();
    _tabController = TabController(
        vsync: this, length: DoubanModel.getMoreTitles(widget.category).length);
  }

  void _initDataSource() {
    _categoryDataSource = CategoryDataSource(onDataCallback: _onDataCallback);
    _requestData();
  }

  void _requestData() {
    if (widget.category == DoubanCategory.Movie) {
      if (_currentTab == 0) {
        _categoryDataSource.requestRecentMovie();
      } else if (_currentTab == 1) {
        _categoryDataSource.requestCollectionMovie();
      } else if (_currentTab == 2) {
        _categoryDataSource.requestHotMovie();
      }
    }else if(widget.category == DoubanCategory.Book) {
      if (_currentTab == 0) {
        _categoryDataSource.requestRecentBook();
      } else if (_currentTab == 1 ) {
        _categoryDataSource.requestRecommandBook();
      } else {
        _categoryDataSource.requestHotBook();
      }
    }else {    
      if (_currentTab == 0) {
        _categoryDataSource.requestRecentMusic();
      } else if (_currentTab == 1 ) {
        _categoryDataSource.requestHotMusic();
      }      
    } 
  }

  void _onDataCallback() {
    _categoryDataSource.isPageLoading = false;
    setState(() {});
  }

  void _onTabbarTapped(int index) {
    _currentTab = index;
    _categoryDataSource.reset();
    _requestData();
    setState(() {});
  }

  void _onLoading() {
    _categoryDataSource.page++;
    _requestData();
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
      onTap: _onTabbarTapped,
      controller: _tabController,
      unselectedLabelColor: Colors.white,
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      unselectedLabelStyle:
          TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      labelPadding: EdgeInsets.only(bottom: 8),
      tabs: _tabs(),
    );
  }

  List<Widget> _tabs() {
    List<Widget> tabs = List();
    for (int i = 0;
        i < DoubanModel.getMoreTitles(widget.category).length;
        i++) {
      tabs.add(Text(DoubanModel.getMoreTitles(widget.category)[i]));
    }
    return tabs;
  }

  List<Widget> _tabViews() {
    List<Widget> tabs = List();
    for (int i = 0;
        i < DoubanModel.getMoreTitles(widget.category).length;
        i++) {
      tabs.add(_categoryList());
    }
    return tabs;
  }

  Widget _categoryList() {
    if (_categoryDataSource.isPageLoading) {
      return CupertinoActivityIndicator();
    } else {
      return SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        controller: _refreshController,
        onLoading: _onLoading,
        child: ListView.separated(
            itemBuilder: _buildItem,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 21,
              );
            },
            itemCount: _getItemCount()),
        footer: CustomFooter(builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            return Container();
          } else if (mode == LoadStatus.loading) {
            return CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text('Loading failed');
          } else if (mode == LoadStatus.canLoading) {
            body = Text('Release to load');
          } else {
            body = Text('No more data');
          }
          return Container(
            height: 55,
            child: Center(
              child: body,
            ),
          );
        }),
      );
    }
  }

  int _getItemCount() {
    if (widget.category == DoubanCategory.Movie) {
      return _categoryDataSource.movieList.length;
    } else if (widget.category == DoubanCategory.Book) {
      return _categoryDataSource.bookList.length;
    } else {
      return _categoryDataSource.musicList.length;
    }     
  }

  Widget _buildItem(BuildContext context, int index) {
    if (_categoryDataSource.isPageLoading) {
      return Container();
    }
    return CategoryDetailItem(
      context: context,
      category: widget.category,
      movie: widget.category == DoubanCategory.Movie ? _categoryDataSource.movieList[index] : null,
      book: widget.category == DoubanCategory.Book ? _categoryDataSource.bookList[index] : null,
      music: widget.category == DoubanCategory.Music ? _categoryDataSource.musicList[index] : null,
    );
  }
}
