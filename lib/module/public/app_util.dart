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
}