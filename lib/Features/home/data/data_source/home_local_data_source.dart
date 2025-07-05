import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entity/book_entity.dart';

abstract class HomeLocalDataSource{

  List<BookEntity> fetchFeaturedBook({int pageNumber = 0});
  List<BookEntity> fetchNewestBook();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBook({int pageNumber = 0}) {
    int startIndex = pageNumber*10;
    int endIndex = (pageNumber+1)*10;
    var box  = Hive.box<BookEntity>(kFeaturedBooks);
    int length = box.values.length;
    if (startIndex>=length||endIndex>length) {
      return[];
    }return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchNewestBook() {
    var box  = Hive.box<BookEntity>(kNewestBooks);
    return box.values.toList();
  }
}