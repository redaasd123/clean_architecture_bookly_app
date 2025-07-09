
import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_cases/similar_books_use_case.dart';
import 'package:bookly_app/core/use_case/params/fetch_similar_books_params.dart';
import 'package:meta/meta.dart';


part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooks) : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase fetchSimilarBooks;

  Future<void> fetchSimilarBook({required String category,int pageNumber = 0})async{
    print("📥 fetching page number  redadadda: $pageNumber");
    emit(SimilarBooksLoading());

    var result = await fetchSimilarBooks.call( FetchSimilarBooksParams(
        category: category, pageNumber: pageNumber));
    result.fold((failure){
      emit(SimilarBooksFailure(errMessage: failure.errMessage));
    }, (book){
      emit(SimilarBooksSuccess(book: book));
    });
  }


}
