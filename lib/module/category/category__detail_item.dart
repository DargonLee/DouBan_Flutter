import 'package:douban/module/widgets/rank_container.dart';
import 'package:flutter/material.dart';

class CategoryDetailItem extends StatelessWidget {

  void _onItemTapped () {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _onItemTapped,
      child: Container(
        padding: EdgeInsets.only(left: 24, right: 24, top: 9),
        child: Row(
          children: <Widget>[
            FadeInImage.assetNetwork(
              width: 86,
              height: 122,
              placeholder: 'lib/images/scan.png', 
              image: 'http://a0.att.hudong.com/78/52/01200000123847134434529793168.jpg'
            ),
            Container(width: 14,),
            Column(
              children: <Widget>[
                RankContainer(
                  width: 220,
                  height: 40,
                  title: '近期',
                  rank: 4,
                  score: 7.8,
                ),
                Container(height: 3,),
                Container(
                  width: 220,
                  child: Text(
                    '这时你可能会问了，如果关闭了这个设置，我想看到自动补全该怎么办呢？不用担心，当你按下 “Ctrl + 空格键” 之后',
                    style: TextStyle(fontSize: 10, color: Color(0xFF999999)),
                    maxLines: 5,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}