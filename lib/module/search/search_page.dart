import 'package:douban/module/public/app_util.dart';
import 'package:douban/module/search/search_data_source.dart';
import 'package:douban/module/widgets/root_page.dart';
import 'package:douban/module/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  SearchDataSource _dataSource;
  List<String> _recentWords = List();

  void _onSubmitted (String value) {
    _dataSource.saveInput(AppUtil.componentWords(value, _recentWords));
  }

  void _onCancelTapped () {
    Navigator.pop(context);
  }

  void _onClearTapped () {
    _recentWords.clear();
    _dataSource.clear();
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataSource = SearchDataSource();
    _dataSource.readRecentSearch().then((onValue) {
      if (onValue == '') {
        return;
      }
      _recentWords = AppUtil.splitWord(onValue);
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RootPage(
      body: Container(
        height: 170,
        color: Color(0xFF333C9FF),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              _topWidget(),
              _recentSearchContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topWidget () {
    return Container(
      height: 52,
      padding: EdgeInsets.only(left: 15, top: 20, right: 20),
      child: _searchbar(),
    );
  }

  Widget _searchbar () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SearchBar(
          isEnable: true,
          onSubmit: _onSubmitted,
        ),
        GestureDetector(
          onTap: _onCancelTapped,
          child: Text(
            '取消',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _recentSearchContainer () {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 12, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Text('最近搜索', style: TextStyle(fontSize: 18, color: Colors.white)),
              GestureDetector(
                child: Text('清除', style: TextStyle(fontSize: 14, color: Colors.white)),
                onTap: _onClearTapped,
              ),
            ]
          ),
          _searchWordList()
        ], 
      ),
    );
  }

  Widget _searchWordList () {
    return Container(
      height: 28,
      margin: EdgeInsets.only(top: 4),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _recentWords.length,
        itemBuilder: (BuildContext context, int index) {
          return SearchWording(word: _recentWords[index]);
        }, 
        separatorBuilder: (BuildContext context, int index) {
          return Container(width: 10);
        }, 
      ),
    );
  }
}

// 搜索栏底部的文字组件
class SearchWording extends StatelessWidget {
  final String word;

  SearchWording({
    Key key,
    this.word
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
      decoration: BoxDecoration(
        color: Color(0x1f000000),
        borderRadius: BorderRadius.circular(4), 
      ), 
      child: Text(this.word, style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}