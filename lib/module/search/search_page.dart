import 'package:douban/module/widgets/root_page.dart';
import 'package:douban/module/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {

  void _onSubmitted (String value) {

  }

  void _onCancelTapped () {
    
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RootPage(
      body: Container(
        height: 170,
        color: Color(0xFF333C9FF),
        child: SafeArea(
          child: Column(
            children: <Widget>[

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
      children: <Widget>[
        SearchBar(
          isEnable: true,
          onSubmit: _onSubmitted,
        ),
        GestureDetector(
          onTap: _onCancelTapped,
        )
      ],
    );
  }
}