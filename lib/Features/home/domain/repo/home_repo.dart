

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/book_entity.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookEntity>>>
  fetchFeaturedBook({int pageNumber = 0});
  Future<Either<Failure,List<BookEntity>>>
  fetchNewestBook({int pageNumber = 0 });
  Future<Either<Failure,List<BookEntity>>>
  fetchSimilarBooks({ required String category,int pageNumber = 0 });


  // اي ميثود هنا بتمثل    usecase
  //الدومين هي اللي بيتحدد فيها اية اللي هيحصل في التطبيق بتاعي//
}