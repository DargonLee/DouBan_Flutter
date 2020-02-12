import 'package:douban/module/model/douban_model.dart';

class WatchModel {
  DoubanCategory category;
  String id;

  WatchModel(this.category, this.id);

  WatchModel.fromMap(Map<String, dynamic> map) {
    category = DoubanCategory.values[map['category']];
    id = map['id'];
  }      

  Map toJson() {
    Map map = new Map();
    map["category"] = category.index;
    map["id"] = id;
    return map;
  }    

  static List<WatchModel> fromList(List list) {
    List<WatchModel> watchList = List();
    for (dynamic item in list) {
      watchList.add(WatchModel.fromMap(item));
    }

    return watchList;
  }
}