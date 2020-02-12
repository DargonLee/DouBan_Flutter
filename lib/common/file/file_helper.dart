import 'dart:io';
import 'package:path_provider/path_provider.dart';

final String SearchFile = 'search.txt';

final String MovieWantedFile = 'wanted_movie.txt';
final String MovieWatchedFile = 'watched_movie.txt';

final String BookWantedFile = 'wanted_book.txt';
final String BookWatchedFile = 'watched_book.txt';

final String MusicWantedFile = 'wanted_music.txt';
final String MusicWatchedFile = 'watched_music.txt';

class FileHelper {
  static FileHelper shared = FileHelper();

  void saveString(String str, String path) async {
    await (await _getLocalFile(path)).writeAsString('$str');    
  }

  Future<String> readString(String path) async {
    try {
      File file = await _getLocalFile(path);      
      String contents = await file.readAsString();
      return contents;
    } on FileSystemException {
      return '';
    }
  }  

  Future<File> _getLocalFile(String path) async {    
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/$path');
  }    
}