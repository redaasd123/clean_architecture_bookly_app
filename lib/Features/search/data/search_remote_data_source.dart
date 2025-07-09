import 'package:bookly_app/Features/home/data/model/BookModel.dart';
import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/core/utils/api_service.dart';

// abstract class
abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> searchResult(String query);
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> searchResult(String query) async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=$query',
    );

    List<BookEntity> bookList = [];
    for (var item in data['items']) {
      bookList.add(BookModel.fromJson(item));
    }
    return bookList;
  }
}