import 'package:flutter/material.dart';
import 'package:douban/module/model/movie_model.dart';
import 'package:douban/module/widgets/root_page.dart';
import 'package:douban/module/public/app_util.dart';
import 'package:douban/module/widgets/watch_button.dart';
import 'package:douban/module/model/douban_model.dart';
import 'package:douban/module/widgets/rank_container.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;

  MovieDetailPage({
    Key key,
    this.movie    
  }): super(key: key);

  @override
  Widget build(BuildContext context) {    
    return RootPage(
      title: '电影',
      backroundColor: Color(0xFFEC84A2),
      body: ListView(
        children: <Widget>[
          _configTopContainer(),
          _configBriefWidget(),
          _configDirectorWidget(),
          _configActionsWidget(),
          _configCommentContainer()
        ],
      ),
    );
  }

  Widget _configTopContainer() {
    return Container(   
      color: Color(0xFFEC84A2),   
      height: 165,
      padding: EdgeInsets.fromLTRB(21, 15, 27, 30),
      child: Row(
        children: <Widget>[
          FadeInImage.assetNetwork(
            width: 86,
            height: 122,
            fit: BoxFit.fill,
            placeholder: 'lib/images/scan.png',
            image: movie.image,            
          ),
          Container(width: 19,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                movie.title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
              Container(
                width: AppUtil.screenWidth - 21 - 86 - 19 - 27,                
                child: Text(
                  //'2019/中国大陆/剧情 都市/99分钟/ 姚晨 / 袁弘 / 李九霄 / 梁冠华 / 杨新鸣 / 吴玉芳',
                  '${movie.year}/ ${AppUtil.getTextString(movie.genres)}/ ${movie.durations}${AppUtil.getTextStringFromCasts(movie.casts)}',
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
                      category: DoubanCategory.Movie,
                      id: movie.id,
                    ),
                  WatchButton(
                    type: WatchType.Watched,
                    category: DoubanCategory.Movie,
                    id: movie.id,                    
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
      color: Color(0xFFEC84A2),
      height: 173,
      padding: EdgeInsets.only(left: 23, right: 21, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '剧情简介',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold    
            ),
          ),
          Container(height: 16,),
          Text(
            '　　盛男（姚晨饰），女，独立上进有追求，渴望真爱却仍孑然一身。一次意外发现自己患上了卵巢癌，需要进行手术，但父亲出轨，母亲幼稚，家庭给不了她可能的支持，她不得不接受一份自己不喜欢的工作去筹手术费。天生骄傲的盛男，在生死关头才发现成年人想生存的体面比想象中还艰难，在一次又一次的希望与绝望中，最终用自己的方式和世界和解。',
            style: TextStyle(
              fontSize: 12
            ),   
            softWrap: true,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,         
          )
        ],
      ),
    );
  }

  Widget _configDirectorWidget() {
    return Container(
      color: Color(0xFFEC84A2),
      height: 177,
      padding: EdgeInsets.only(left: 23, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Text(
            '导演表',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold    
            ),
          ),     
          Container(height: 20,),
          Expanded(
            child: ListView.separated(    
              scrollDirection: Axis.horizontal,
              itemCount: movie.directors.length,
              itemBuilder: (BuildContext context, int index) {
                return Image(
                  width: 72,
                  height: 102,    
                  fit: BoxFit.cover,            
                  image: NetworkImage(
                    movie.directors[index]['avatars']['large']
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(width: 20,);
              },
            ),
          )          
        ],
      ),
    );
  }  

  Widget _configActionsWidget() {
    return Container(
      color: Color(0xFFEC84A2),
      height: 177,
      padding: EdgeInsets.only(left: 23, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Text(
            '演员表',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold    
            ),
          ),     
          Container(height: 20,),
          Expanded(
            child: ListView.separated(    
              scrollDirection: Axis.horizontal,
              itemCount: movie.casts.length,
              itemBuilder: (BuildContext context, int index) {
                return Image(
                  width: 72,
                  height: 102,    
                  fit: BoxFit.cover,            
                  image: NetworkImage(
                    movie.casts[index].avatar
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(width: 20,);
              },
            ),
          )          
        ],
      ),
    );
  }

  Widget _configCommentContainer() {
    return Container(
      color: Color(0xFFEC84A2),
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
                return Container(height: 27,);
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
              backgroundImage: NetworkImage('https://img1.doubanio.com/view/photo/l/public/p2582159659.webp'),
            ),
            Container(width: 10,),
            Text('观众${index}')
          ],
        ),
        Container(height: 15,),
        Text(
          '本片片名引自《红楼梦》，精神上也致敬这部伟大的中国小说，写垢与净，真与假，生与死，探索“无常”。茶烟渐起，清谈渐欢，雅俗之间，悦人欢颜。呼朋唤友，且观片去。',
          softWrap: true,
          maxLines: 4,
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