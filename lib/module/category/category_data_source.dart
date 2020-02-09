import 'package:douban/common/network/network_helper.dart';
import 'package:douban/module/model/movie_model.dart';

class CategoryDataSource {
  final void Function() onDataCallback;

  CategoryDataSource({
    this.onDataCallback
  });

  int page = 1;
  bool isCollection = false;
  bool isPageLoading = false;
  List movieList = List();

  void reset() {
    movieList.clear();
    page = 1;
    isCollection = false;
    isPageLoading = true;
  }

  // 电影的网络数据
  void requestRecentMovie() {
    String url = 'http://sas.qq.com/cgi-bin/db/data?t=%5B%22ke_coding_movie%22%5D&q=%7Bke_coding_movie(_page:$page,_limit:10,year:%22%252019%25%22)%7Bid,title,rating%7Bmax,average,stars,min,details%7Bscore_1,score_2,score_3,score_4,score_5%7D%7D,genres,casts%7Balt,avatars%7Bsmall,large,medium%7D,name,name_en,id%7D,durations,mainland_pubdate,pubdates,has_video,collect_count,original_title,subtype,directors%7Balt,avatars%7Bsmall,large,medium%7D,name,id%7D,year,images%7Bsmall,large,medium%7D,alt%7D%7D';
    NetworkHelper.shared.requestDouBanList(url, _onMovieCallback);
  }
  void requestCollectionMovie() {
    isCollection = true;
    String url = 'http://sas.qq.com/cgi-bin/db/data?t=%5B%22ke_coding_movie%22%5D&q=%7Bke_coding_movie(_page:$page,_limit:10)%7Bid,title,rating%7Bmax,average,stars,min,details%7Bscore_1,score_2,score_3,score_4,score_5%7D%7D,genres,casts%7Balt,avatars%7Bsmall,large,medium%7D,name,name_en,id%7D,durations,mainland_pubdate,pubdates,has_video,collect_count,original_title,subtype,directors%7Balt,avatars%7Bsmall,large,medium%7D,name,id%7D,year,images%7Bsmall,large,medium%7D,alt%7D%7D';
    NetworkHelper.shared.requestDouBanList(url, _onMovieCallback);
  }
  void requestHotMovie() {
    String url = 'https://api.douban.com/v2/movie/top250?apikey=0b2bdeda43b5688921839c8ecb20399b';
    NetworkHelper.shared.requestDouBanList(url, _onHotMovieCallback);
  }
  void _onMovieCallback(int statusCode, dynamic resultMap) {
    if (statusCode == 200 && resultMap is Map) {
      for (dynamic result in resultMap['result']) {
        if (isCollection) {
          MovieModel movie = MovieModel.castFromMap(result);
          if(movie.collectionCount > 100000) {
            movieList.add(movie);
          }
        }
        movieList.add(MovieModel.castFromMap(result));
      }
    }
    isCollection = false;
    onDataCallback();
  }

  void _onHotMovieCallback(int statusCode, dynamic resultMap) {
    if (statusCode == 200 && resultMap is Map) {    
      for (dynamic result in resultMap['subjects']) {
        movieList.add(MovieModel.castFromMap(result));
      }

      onDataCallback();
    }
  }
  // 图书的网络数据
  // 音乐的网络数据
}