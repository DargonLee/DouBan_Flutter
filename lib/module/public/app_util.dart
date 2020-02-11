import 'package:douban/module/model/movie_model.dart';
class AppUtil {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  
  // 以逗号分割字符串
  static List splitWord(String word) {
    return word.split(',');
  }

  static String componentWords(String input, List<String> list) {
    String value = '';
    if(list.isEmpty) {
      value = input;
      return value;
    }else {
      value = '${list[0]}';
    }

    for(int i = 1; i < list.length; i++) {
      value += ',${list[i]}';
    }
    value += ',$input';
    return value;
  }

  // 获取评分
  static int getRank(double rating) {
    if (0 < rating && 2 >= rating) {
      return 1;
    }else if(2 < rating && 4 >= rating) {
      return 2;
    }else if(4 < rating && 6 >= rating) {
      return 3;
    }else if(6 < rating && 8 >= rating) {
      return 4;
    }else if(8 < rating && 10 >= rating) {
      return 5;
    }else {
      return 0;
    }
  }

  // 获取文本内容
  static String getTextString(List lists) {
    if (lists.length == 0) return '';

    String listString = lists[0];
    for (int i = 1; i < lists.length; i++) {
      listString += ' / ${lists[i]}';
    }
    return listString;
  }

  static String getTextStringFromCasts(List lists) {
    String listString = '';
    for (int i = 1; i < lists.length; i++) {
      Cast cast = lists[i];
      listString += ' / ${cast.name}';
    }    

    return listString;
  }

  // 获取当前月
  static int getCurrentMonth() {
    var now = DateTime.now().millisecondsSinceEpoch; // 时间戳
    return DateTime.fromMillisecondsSinceEpoch(now).month;
  }

  // 获取当前天
  static int getCurrentDay() {
    var now = DateTime.now().millisecondsSinceEpoch; // 时间戳
    return DateTime.fromMillisecondsSinceEpoch(now).day;
  }
}