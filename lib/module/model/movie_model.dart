import 'package:douban/module/public/app_util.dart';
import 'package:douban/module/public/cust_util.dart';

class MovieModel {
  String id = '';
  String title = '';
  double rating = 0;
  int rank = 0;
  List genres = List();
  List casts = List();
  String durations = '';
  List directors = List();
  String year = '';
  String image = '';
  int collectionCount = 0;

  MovieModel.castFromMap(dynamic map) {
    if (map['id'] != null) {
      id = map['id'];
    }
    if (map['title'] != null) {
      title = map['title'];
    }
    if (map['rating'] != null && map['rating'] is Map) {
      Map ratingMap = map['rating'];
      if (ratingMap['average'] != null) {
        //rating = StringToDouble(ratingMap['average']);
        if (ratingMap['average'] is String) {
          rating = StringToDouble(ratingMap['average']);
        }else if (ratingMap['average'] is double) {
          rating = ratingMap['average'];
        }else if (ratingMap['average'] is int) {
          rating = 7;
        }
        
        rank = AppUtil.getRank(rating);
      }
    }
    if (map['genres'] != null && map['genres'] is List) {
      genres = map['genres'];
    }
    if (map['casts'] != null && map['casts'] is List) {
      for (dynamic cast in map['casts']) {
        casts.add(Cast.castFromMap(cast));
      }
    }
    if (map['directors'] != null && map['directors'] is List) {
      for (dynamic cast in map['directors']) {
        directors.add(Cast.castFromMap(cast));
      }      
    } 
    if (map['durations'] != null && map['durations'] is List) {
      List durationList = map['durations'];
      if (durationList.length > 0) {
        durations = durationList[0];
      }
    }
    if (map['directors'] != null) {
      directors = map['directors'];
    }
    if (map['year'] != null) {
      year = map['year'];
    }
    if (map['images'] != null && map['images'] is Map) {
      Map imageList = map['images'];
      if(imageList['large'] != null) {
        image = imageList['large'];
      }
    }
    if (map['collect_count'] != null) {
      collectionCount = map['collect_count'];
    }
  }
}

class Cast {
  String alt = '';
  String avatar = '';
  String name = '';
  String id = '';

  Cast.castFromMap(dynamic map) {
    if (map['alt'] != null) {
      alt = map['alt'];
    }

    if (map['avatars'] != null && map['avatars'] is Map) {
      Map avatars = map['avatars'];
      if (avatars['large'] != null) {
        avatar = avatars['large'];
      }
    }

    if (map['name'] != null) {
      name = map['name'];
    }

    if (map['id'] != null) {
      id = map['id'];
    }            
  }
}