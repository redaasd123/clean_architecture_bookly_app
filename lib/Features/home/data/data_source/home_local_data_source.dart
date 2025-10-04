import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../domain/entity/book_entity.dart';

abstract class HomeLocalDataSource{

  List<BookEntity> fetchFeaturedBook({int pageNumber = 0});
  List<BookEntity> fetchNewestBook({ int pageNumber = 0});
  List<BookEntity> fetchSimilarBook({required String category, int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBook({int pageNumber = 0}) {
    int startIndex = pageNumber*10;
    int endIndex = (pageNumber+1)*10;
    var box  = Hive.box<BookEntity>(kFeaturedBooks);
    int length = box.values.length;
    if (startIndex>=length) {
      return[];
    }if(endIndex>length){
     endIndex = length;
    }

    return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchNewestBook({int pageNumber = 0}) {

    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kNewestBooks);
    int length = box.values.length;


    if (startIndex >= length) {
      return [];
    }

    if (endIndex > length) {
      endIndex = length;
    }

    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchSimilarBook({required String category, int pageNumber = 0}) {
    int startIndex = pageNumber*10;
    int endIndex = (pageNumber+1)*10;
    var box  = Hive.box<BookEntity>(kSimilarBooks);
    int length = box.values.length;
    if (startIndex>=length) {
      return[];
    }if(endIndex>length){
      endIndex = length;
    }

    return box.values.toList().sublist(startIndex,endIndex);

  }

  }


