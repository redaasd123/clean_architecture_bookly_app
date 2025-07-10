import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repo/home_repo.dart';
import 'package:bookly_app/Features/search/data/data_source/search_local_data_source.dart';
import 'package:bookly_app/Features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookly_app/Features/search/domain/repo/search_repo.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';

class SearchRepoImpl extends SearchRepo{
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;

  SearchRepoImpl(this.searchRemoteDataSource, this.searchLocalDataSource);
  @override
  Future<Either<Failure, List<BookEntity>>> searchResult(String query) async{
    var bookList  = await searchLocalDataSource.searchResult(query);
    if(bookList.isNotEmpty){
      return right(bookList);
    }
   try {
     var result  = await searchRemoteDataSource.searchResult(query);
     return right(result);
   } on Exception catch (e) {
     if(e is DioError){
       return left(ServerFailure.fromDioError(e));
     }else{
       return left(ServerFailure(errMessage: e.toString()));
     }
   }
   

  }
}