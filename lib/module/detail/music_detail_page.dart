import 'package:douban/module/model/douban_model.dart';
import 'package:douban/module/model/music_model.dart';
import 'package:douban/module/public/app_util.dart';
import 'package:douban/module/widgets/rank_container.dart';
import 'package:douban/module/widgets/root_page.dart';
import 'package:douban/module/widgets/watch_button.dart';
import 'package:flutter/material.dart';


class MusicDetailPage extends StatelessWidget {
  final MusicModel music;
  
  MusicDetailPage({
    this.music
  });

  @override
  Widget build(BuildContext context) {    
    return RootPage(
      title: '音乐',
      backroundColor: Color(0xFF6aab6f),
      body: ListView(
        children: <Widget>[
          _configTopContainer(),
          _configBriefWidget(),
          _configCommentContainer()
        ],
      ),
    );
  }

  Widget _configTopContainer() {
    return Container(   
      color: Color(0xFF6aab6f),   
      height: 165,
      padding: EdgeInsets.fromLTRB(21, 15, 27, 30),
      child: Row(
        children: <Widget>[
          FadeInImage.assetNetwork(
            width: 86,
            height: 122,
            fit: BoxFit.fill,
            placeholder: 'lib/images/scan.png',
            image: music.image,            
          ),
          Container(width: 19,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: AppUtil.screenWidth - 21 - 86 - 19 - 27,
                child: Text(
                  music.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                  maxLines: 2,
                ),
              ),
              Container(
                width: AppUtil.screenWidth - 21 - 86 - 19 - 27,                
                child: Text(                  
                  '${AppUtil.getTextString(music.tags)}',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white
                  ),
                ),
              ),
              Container(
                width: AppUtil.screenWidth - 21 - 86 - 19 - 27,  
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    WatchButton(
                      type: WatchType.Wanted,
                      category: DoubanCategory.Music,
                      id: music.id,
                    ),
                  WatchButton(
                    type: WatchType.Watched,
                    category: DoubanCategory.Music,
                    id: music.id,
                    )                  
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _configBriefWidget() {
    return Container(     
      color: Color(0xFF6aab6f), 
      padding: EdgeInsets.only(left: 23, right: 21, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '简介',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold    
            ),
          ),
          Container(height: 16,),
          Text(
            '　　${music.attr.tracks[0]}',
            style: TextStyle(
              fontSize: 12
            ),           
          )
        ],
      ),
    );
  }

  Widget _configCommentContainer() {
    return Container(
      color: Color(0xFF6aab6f),
      height: 122.0 * 4 + 20 + 25,
      padding: EdgeInsets.only(left: 23, bottom: 30, right: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Text(
            '评论',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold              
            ),
          ),     
          Container(height: 20,),
          Expanded(
            child: ListView.separated(   
              physics: NeverScrollableScrollPhysics(),               
              itemCount: 4,
              itemBuilder: _buildCommentItem,
              separatorBuilder: (BuildContext context, int index) {
                return Container(height: 37,);
              },
            ),
          )          
        ],
      ),
    );    
  }

  Widget _buildCommentItem(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 14.0,
              backgroundImage: NetworkImage('https://img9.doubanio.com/view/subject/m/public/s29491796.jpg'),
            ),
            Container(width: 7,),
            RankContainer(
              width: 68,
              heigth: 28,
              starWidth: 8,
              title: '观众${index}',
              rank: 4,
              score: 7.6,
            )
          ],
        ),
        Container(height: 15,),
        Text(
          '本片片名引自《红楼梦》，精神上也致敬这部伟大的中国小说，写垢与净，真与假，生与死，探索“无常”。茶烟渐起，清谈渐欢，雅俗之间，悦人欢颜。呼朋唤友，且观片去。',
          softWrap: true,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white
          ),
        )
      ],
    );
  }
}