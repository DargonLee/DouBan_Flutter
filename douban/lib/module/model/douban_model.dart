enum DoubanCategory {
  Movie,
  Book,
  Music
}

class DoubanModel {
  static String getDoubanTitle(DoubanCategory category) {
    if (category == DoubanCategory.Movie) {
      return '电影';
    }else if (category == DoubanCategory.Book) {
      return '图书';
    }else if (category == DoubanCategory.Music) {
      return '音乐';
    }
  }

  static List<String> getMoreTitles(DoubanCategory category) {
    if(category == DoubanCategory.Movie) {
      return ['近期热映', '猜你喜欢', '豆瓣热门'];
    }else if(category == DoubanCategory.Book) {
      return ['新书速递', '今日推荐', '豆瓣热门'];
    }else if (category == DoubanCategory.Music) {
      return ['新碟榜', '豆瓣热门'];
    }
  }

  static List<String> getPersonalTitles() {
    return ['影视', '图书', '音乐'];
  }
}