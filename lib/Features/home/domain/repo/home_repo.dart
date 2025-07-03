

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/book_entity.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookEntity>>>fetchFeaturedBook();
  Future<Either<Failure,List<BookEntity>>>fetchNewestBook();
  //الدومين هي اللي بيتحدد فيها اية اللي هيحصل في التطبيق بتاعي//
}