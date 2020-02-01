import 'package:douban/module/public/app_util.dart';
import 'package:douban/module/widgets/rank_container.dart';
import 'package:flutter/material.dart';

class DisplayItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: _buildItem, 
        separatorBuilder: (BuildContext context ,index) {
          return Container(
            width: (AppUtil.screenWidth - 4 * 80 - 20)/3,
          );
        },
        itemCount: 4
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: <Widget>[
          FadeInImage.assetNetwork(
            width: 80,
            height: 112,
            placeholder: 'lib/images/scan.png', 
            image: 'http://a0.att.hudong.com/78/52/01200000123847134434529793168.jpg'
          ),
          Container(height: 10,),
          RankContainer(
            width: 80,
            height: 34,
            rank: 4,
            score: 7.6,
          )
        ],
      ),
    );
  }
}