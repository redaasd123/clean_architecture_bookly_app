import 'package:hive/hive.dart';

import '../../../Features/home/domain/entity/book_entity.dart';

void saveBooksData(List<BookEntity> books,String boxName) {
  var  box =  Hive.box(boxName);
  box.addAll(books);
}