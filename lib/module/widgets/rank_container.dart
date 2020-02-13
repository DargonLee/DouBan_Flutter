import 'package:flutter/material.dart';
class RankContainer extends StatelessWidget {
  RankContainer({
    Key key,
    this.title = '默认',
    this.rank,
    this.score,
    this.width,
    this.starWidth = 10.0,
    this.height, int heigth
  });

  final double height;
  final int rank;
  final double score;
  final double starWidth;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: this.width,
      height: this.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: this.width,
            child: Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.black),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ), 
          ),
          Container(
            width: this.width > 90 ? 90 : width,
            height: 14,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      if (index < rank) {
                        return Image(
                          width: starWidth,
                          image: AssetImage('lib/images/star_blue.png')
                        );
                      }else {
                        return Image(
                          width: starWidth,
                          image: AssetImage('lib/images/star_grey.png')
                        );
                      }
                    }, 
                    separatorBuilder: (BuildContext context, index) {
                      return Container(width: 2,);
                    }, 
                    itemCount: 5),
                ),
                Text(
                  '$score',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF999999)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}