import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart' show Hive;

abstract class SearchLocalDataSource {
  List<BookEntity> searchResult(String query);
}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  @override
  List<BookEntity> searchResult(String query) {
    final  box = Hive.box<BookEntity>(kSearchBooks);
    final results = box.values.where((book) {
      return book.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return results;
  }
}