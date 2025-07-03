

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/book_entity.dart';
import '../repo/home_repo.dart';

class fetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,NoParam>{
  final HomeRepo homeRepo;
  fetchFeaturedBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([param]) async{
    return await homeRepo.fetchFeaturedBook();
  }

  }

