

import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/funcation/save_books.dart';
import '../../domain/entity/book_entity.dart';
import '../model/BookModel.dart';

abstract class HomeRemoteDataSource{
  HomeRemoteDataSource();
  Future<List<BookEntity>> fetchFeaturedBook();
  Future<List<BookEntity>> fetchNewestBook();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBook()async {
    var data  = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=programming');
    List<BookEntity> books = getBooksList(data);

   saveBooksData(books,kFeaturedBooks);
    return books;

  }




  @override
  Future<List<BookEntity>> fetchNewestBook() async{
    var data  = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = getBooksList(data);
    return books;

  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List <BookEntity> books = [];
    for (var bookMab in data["items"]){
      books.add(BookModel.fromJson(bookMab));
    }
    return books;
  }
}
