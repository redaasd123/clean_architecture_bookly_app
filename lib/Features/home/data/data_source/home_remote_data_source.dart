import 'package:bookly_app/constants.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/funcation/save_books.dart';
import '../../domain/entity/book_entity.dart';
import '../model/BookModel.dart';
abstract class HomeRemoteDataSource{
  HomeRemoteDataSource();
  Future<List<BookEntity>> fetchFeaturedBook({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBook({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks({required String category,int pageNumber = 0 });
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBook({int pageNumber = 0}) async {
    var data = await apiService.get(endPoint:
    'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber *
        10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBooks);
    return books;
  }


  @override
  Future<List<BookEntity>> fetchNewestBook({int pageNumber = 0}) async {
    var data = await apiService.get(endPoint:
    'volumes?Filtering=free-ebooks&q=sport&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBooks);
    return books;
  }


  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category,int pageNumber = 0}) async {
    var data = await apiService.get(endPoint:
    'volumes?Filtering=free-ebooks&q=$category&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBooks);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    if (data["items"] != null) {
      for (var bookMap in data["items"]) {
        try {
          if (bookMap["volumeInfo"] != null &&
              bookMap["saleInfo"] != null &&
              bookMap["accessInfo"] != null) {
            books.add(BookModel.fromJson(bookMap));
          }
        } catch (e) {
          // تجاهل العناصر اللي حصل فيها خطأ أثناء التحويل
          continue;
        }
      }
    }

    return books;
  }


}
