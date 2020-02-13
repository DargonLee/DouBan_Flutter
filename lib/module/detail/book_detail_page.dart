import 'package:douban/module/model/douban_model.dart';
import 'package:douban/module/public/app_util.dart';
import 'package:douban/module/widgets/rank_container.dart';
import 'package:douban/module/widgets/watch_button.dart';
import 'package:flutter/material.dart';
import 'package:douban/module/model/book_model.dart';
import 'package:douban/module/widgets/root_page.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;

  BookDetailPage({
    Key key,
    this.book
  }): super(key: key);

  @override
  Widget build(BuildContext context) {    
    return RootPage(
      title: '图书',
      backroundColor: Color(0xFFF99D50),
      body: ListView(
        children: <Widget>[
          _configTopContainer(),
          _configPrefaceWidget(),
          _configBriefWidget(),                    
        ],
      ),
    );
  }

  Widget _configTopContainer() {
    return Container(  
      color: Color(0xFFF99D50),    
      height: 165,
      padding: EdgeInsets.fromLTRB(21, 15, 27, 30),
      child: Row(
        children: <Widget>[
          FadeInImage.assetNetwork(
            width: 86,
            height: 122,
            fit: BoxFit.fill,
            placeholder: 'lib/images/scan.png',
            image: book.image,            
          ),
          Container(width: 19,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: AppUtil.screenWidth - 21 - 86 - 19 - 27,
                child: Text(
                  book.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
              Container(
                width: AppUtil.screenWidth - 21 - 86 - 19 - 27,                
                child: Text(                  
                  '${AppUtil.getTextString(book.author)} / ${book.pubdate} / 出版社: ${book.publisher} / 翻译: ${AppUtil.getTextString(book.translator)}',
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
                      category: DoubanCategory.Book,
                      id: book.id,
                    ),
                  WatchButton(
                      type: WatchType.Watched,
                      category: DoubanCategory.Book,
                      id: book.id,
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

  Widget _configPrefaceWidget() {
    return book.catalog == ''  ? Container() : Container(   
      color: Color(0xFFF99D50),   
      padding: EdgeInsets.only(left: 23, right: 21, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '目录',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold    
            ),
          ),
          Container(height: 16,),
          Text(
            '      ${book.catalog}',
            style: TextStyle(
              fontSize: 12
            ),            
          )
        ],
      ),
    );    
  }

  Widget _configBriefWidget() {
    return Container(    
      color: Color(0xFFF99D50),  
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
            // '　　盛男（姚晨饰），女，独立上进有追求，渴望真爱却仍孑然一身。一次意外发现自己患上了卵巢癌，需要进行手术，但父亲出轨，母亲幼稚，家庭给不了她可能的支持，她不得不接受一份自己不喜欢的工作去筹手术费。天生骄傲的盛男，在生死关头才发现成年人想生存的体面比想象中还艰难，在一次又一次的希望与绝望中，最终用自己的方式和世界和解。',
            '      ${book.summary}',
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
      height: 122.0 * 7 + 20 + 25,
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
              itemCount: 7,
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