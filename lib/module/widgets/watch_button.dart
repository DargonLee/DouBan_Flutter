import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:douban/module/model/watch_model.dart';
import 'package:douban/module/model/douban_model.dart';
import 'package:douban/common/file/file_helper.dart';
import 'package:douban/module/widgets/toast_util.dart';

enum WatchType {Wanted, Watched}

class WatchButton extends StatelessWidget {
  final WatchType type;
  final DoubanCategory category;
  final String id;

  WatchButton({    
    this.type,
    this.category,
    this.id,
  });

  BuildContext _context;

  void _onTapped() {
    String path = _getFilePath();

    FileHelper.shared.readString(path).then((onValue) {
      List<WatchModel> watchList = List();
      if (onValue.isEmpty) {
        watchList.add(WatchModel(category, id));
      } else {
        watchList = WatchModel.fromList(jsonDecode(onValue));
        watchList.add(WatchModel(category, id));        
      }

      String json = jsonEncode(watchList);
      FileHelper.shared.saveString(json, path);     

      ToastUtil.show(_context, '存储成功');
    });
  }

  String _getFilePath() {
    String path = '';
    if (category == DoubanCategory.Movie) {
      path = type == WatchType.Wanted ? MovieWantedFile : MovieWatchedFile;
    } else if (category == DoubanCategory.Book) {
      path = type == WatchType.Wanted ? BookWantedFile : BookWatchedFile;
    } else {
      path = type == WatchType.Wanted ? MusicWantedFile : MusicWatchedFile;
    }
    return path;
  }

  @override
  Widget build(BuildContext context) {    
    _context = context;

    return InkWell(
      onTap: _onTapped,
      child: Container(
        width: 93,
        height: 31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white
        ),       
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(type == WatchType.Wanted ? 'lib/images/want_watch.png' : 'lib/images/has_watch.png'),            
            ),
            Container(width: 2,),
            Text(
              type == WatchType.Wanted ? '想看' : '看过',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black
              ),
            )
          ],
        ),
      ),
    );
  }
}