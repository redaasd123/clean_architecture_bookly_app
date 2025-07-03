
import 'package:bookly_app/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../Features/home/domain/entity/book_entity.dart';
import '../../Features/home/domain/repo/home_repo.dart';
import '../errors/failure.dart';

class fetchNewestBooksUseCase extends UseCase<List<BookEntity>,NoParam>{
  final HomeRepo homeRepo;
  fetchNewestBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([param]) async{
    return await homeRepo.fetchNewestBook();
  }

}
