import 'package:douban/module/nutrition/nutrition_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:douban/module/widgets/root_page.dart';


class NutritionPage extends StatefulWidget {
  @override
  _NutritionPageState createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.filter_list), onPressed: () {}),
                      IconButton(icon: Icon(Icons.menu), onPressed: () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                '菜单',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: <Widget>[
                        _buildFootItem('lib/images/01.png', '蛋糕', '\$24.00'),
                        _buildFootItem('lib/images/02.png', '鸡尾酒', '\$25.00'),
                        _buildFootItem('lib/images/03.png', '瑞欧', '\$26.00'),
                        _buildFootItem('lib/images/04.png', '点心', '\$27.00'),
                        _buildFootItem('lib/images/05.png', '美女', '\$28.00'),
                        _buildFootItem('lib/images/06.png', '伤心', '\$29.00'),
                        _buildFootItem('lib/images/07.png', '朦胧', '\$30.00'),
                        _buildFootItem('lib/images/08.png', '黄昏', '\$40.00'),
                        _buildFootItem('lib/images/09.png', '痛苦', '\$50.00'),
                        _buildFootItem('lib/images/10.png', '阳光', '\$60.00'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFootItem(String imgPath, String footName, String price) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NutritionDetailPage(heroTag: imgPath,foodName: footName,foodPrice: price,);
          }));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: imgPath,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        footName,
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        price,
                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.add), color: Colors.black, onPressed: () {})
          ],
        ),
      ),
    );
  }
}