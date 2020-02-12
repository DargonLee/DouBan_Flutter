import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:douban/module/model/douban_model.dart';
import 'package:douban/module/model/watch_model.dart';
import 'package:douban/module/personal/personal_data_source.dart';
import 'package:douban/module/widgets/root_page.dart';
import 'package:douban/common/file/file_helper.dart';
import 'package:douban/module/widgets/watch_button.dart';
import 'package:douban/module/widgets/display_item.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<PersonalPage> with SingleTickerProviderStateMixin {
  PersonalDataSource _personalDataSource;
  int _currentTab = 0;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: DoubanModel.getPersonalTitles().length);
    _personalDataSource = PersonalDataSource(onDataCallback: _onDataCallback);
    _requestData(); 
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  void _onTabbarTapped(int index) {
    _currentTab = index;    
    _personalDataSource.reset();
    _requestData();
    setState(() {});
  }

  void _requestData() {
    if (_currentTab == 0) {
      FileHelper.shared.readString(MovieWantedFile).then((onValue) {
        if (onValue.isEmpty) return;
        List<WatchModel> watchList = WatchModel.fromList(jsonDecode(onValue));

        _personalDataSource.requestMovieWantedList(watchList);
      });  

      FileHelper.shared.readString(MovieWatchedFile).then((onValue) {
        if (onValue.isEmpty) return;
        List<WatchModel> watchList = WatchModel.fromList(jsonDecode(onValue));

        _personalDataSource.requestMovieWatchList(watchList);
      });    

      _personalDataSource.hasRsp[0] = true;

    } else if (_currentTab == 1) {
      FileHelper.shared.readString(BookWantedFile).then((onValue) {
        if (onValue.isEmpty) return;
        List<WatchModel> watchList = WatchModel.fromList(jsonDecode(onValue));

        _personalDataSource.requestBookWantedList(watchList);
      });  

      FileHelper.shared.readString(BookWatchedFile).then((onValue) {
        if (onValue.isEmpty) return;
        List<WatchModel> watchList = WatchModel.fromList(jsonDecode(onValue));

        _personalDataSource.requestBookWatchList(watchList);
      });   

      _personalDataSource.hasRsp[1] = true;
    } else {
      FileHelper.shared.readString(MusicWantedFile).then((onValue) {
        if (onValue.isEmpty) return;
        List<WatchModel> watchList = WatchModel.fromList(jsonDecode(onValue));

        _personalDataSource.requestMusicWantedList(watchList);
      });  

      FileHelper.shared.readString(MusicWatchedFile).then((onValue) {
        if (onValue.isEmpty) return;
        List<WatchModel> watchList = WatchModel.fromList(jsonDecode(onValue));

        _personalDataSource.requestMusicWatchList(watchList);
      });     

      _personalDataSource.hasRsp[2] = true;  
    }
  }
  void _onDataCallback() {
    setState(() {
      
    });
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
      onTap: _onTabbarTapped,
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
      tabs.add(_configLikeContainer());
    }
    return tabs;
  }

  Widget _configLikeContainer() {
    return ListView(
      children: <Widget>[
        Container(height: 18,),
        _configWantedContainer(WatchType.Wanted),
        _configWantedContainer(WatchType.Watched),
      ],
    );
  }

  Widget _configWantedContainer(WatchType type) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      height: 220,
      child: Column(
        children: <Widget>[
          Container(height: 26,),
          Row(
            children: <Widget>[
              Image(
                width: 18,
                height: 18,
                image: AssetImage(type == WatchType.Wanted ? 'lib/images/want_watch.png' : 'lib/images/has_watch.png'),
              ),
              Container(width: 2,),
              Text(
                type == WatchType.Wanted ? '想看' : '看过',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              )
            ],
          ),
          Container(height: 10,),    
          DisplayItem(
            context: context,
            category: _currentTab == 0 ? DoubanCategory.Movie : _currentTab == 1 ? DoubanCategory.Book : DoubanCategory.Music,    
            items: _getItems(type),                                         
          ) 
        ],
      ),
    );
  }

  List _getItems(WatchType type) {    
    if (_currentTab == 0) {
      return type == WatchType.Wanted ? _personalDataSource.movieWantedList : _personalDataSource.movieWatchedList;
    } else if (_currentTab == 1) {
      return type == WatchType.Wanted ? _personalDataSource.bookWantedList : _personalDataSource.bookWatchedList;
    } else {
      return type == WatchType.Wanted ? _personalDataSource.musicWantedList : _personalDataSource.musicWatchedList;
    }
  }
}