import '../../domain/entity/book_entity.dart';

abstract class HomeLocalDataSource{

  List<BookEntity> fetchFeaturedBook();
  List<BookEntity> fetchNewestBook();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBook() {
    // TODO: implement fetchFeaturedBook
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBook() {
    // TODO: implement fetchNewestBook
    throw UnimplementedError();
  }
}