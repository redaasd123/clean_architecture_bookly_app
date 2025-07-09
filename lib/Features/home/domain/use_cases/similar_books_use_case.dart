import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/params/fetch_similar_books_params.dart';
import '../../../../core/use_case/use_case.dart';
import '../entity/book_entity.dart';
import '../repo/home_repo.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, FetchSimilarBooksParams> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(FetchSimilarBooksParams params) async {
    return await homeRepo.fetchSimilarBooks(
      category: params.category,
      pageNumber: params.pageNumber,
    );
  }
}