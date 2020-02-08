import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SearchDataSource {

  // 读取数据
  Future<String> readRecentSearch() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsStringSync();
      return contents;
    } on FileSystemException{
      return '';
    }
  }

  // 存储数据
  Future saveInput(value) async {
    await (await _getLocalFile()).writeAsStringSync('$value');
  }

  // 清除数据
  void clear () async {
    (await _getLocalFile()).delete();
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/search.txt');
  }

}