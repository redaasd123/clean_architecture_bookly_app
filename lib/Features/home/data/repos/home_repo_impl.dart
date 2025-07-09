import 'package:bookly_app/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repo/home_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBook({int pageNumber = 0}) async {
     var bookList= await homeLocalDataSource.fetchFeaturedBook(
       pageNumber: pageNumber
     );
     if(bookList.isNotEmpty){
       return right(bookList);
     }
     try {
       var books = await homeRemoteDataSource.fetchFeaturedBook(pageNumber: pageNumber);
       return right(books);
     } on Exception catch (e) {
       if(e is DioError) {
         return left(ServerFailure.fromDioError(e));
       }
         return left(ServerFailure(errMessage: e.toString()));

     }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBook({int pageNumber = 0})async {

    var bookList= await homeLocalDataSource.fetchNewestBook(pageNumber: pageNumber);
    if(bookList.isNotEmpty){
      return right(bookList);
    }
    try {
      var books = await homeRemoteDataSource.fetchNewestBook(pageNumber: pageNumber);
      return right(books);
    } on Exception catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
        return left(ServerFailure(errMessage: e.toString()));

    }

  }

  @override
  Future<Either<Failure, List<BookEntity>>>
  fetchSimilarBooks({required String category,int pageNumber = 0})async {
    var bookList= await homeLocalDataSource.fetchSimilarBook
      (category: category,
        pageNumber: pageNumber);
    if(bookList.isNotEmpty){
      return right(bookList);
    }
    try {
      var books = await homeRemoteDataSource.fetchSimilarBooks(
          category: category
      ,pageNumber: pageNumber);
      return right(books);
    } on Exception catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));

    }

  }}