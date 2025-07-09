import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/search/domain/repo/search_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

 class SearchUseCase extends UseCase<List<BookEntity>,String>{

   final SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call(String query) async{
  return await searchRepo.searchResult(query);
  }


}