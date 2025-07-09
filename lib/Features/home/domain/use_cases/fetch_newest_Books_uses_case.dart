
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/book_entity.dart';
import '../repo/home_repo.dart';

class fetchNewestBooksUseCase extends UseCase<List<BookEntity>,int>{
  final HomeRepo homeRepo;
  fetchNewestBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([pageNumber =0 ]) async{
    return await homeRepo.fetchNewestBook(
      pageNumber:  pageNumber
    );
  }

}
