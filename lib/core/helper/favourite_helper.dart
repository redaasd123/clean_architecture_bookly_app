import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/constants.dart';
import 'package:hive_flutter/adapters.dart';


class FavoriteHelper {
  static final _box = Hive.box<BookEntity>(kSaveFavorite);

  static bool isFavorite(BookEntity book) {
    return _box.containsKey(book.bookId);
  }

  static void toggleFavorite(BookEntity book) {
    if (isFavorite(book)) {
      _box.delete(book.bookId);
    } else {
      _box.put(book.bookId, book);
    }
  }

  static void clearFavorites() {
    _box.clear();
  }
}


