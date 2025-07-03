import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.featuredBooksUseCase) : super(FeaturedBookInitial());
  final fetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void>fetchFeaturedBooks()
 async {
    emit(FeaturedBookLoading());
 var result  = await featuredBooksUseCase.call();
 result.fold((failure){
   emit(FeaturedBookFailure(failure.errMessage));
 }, (books){
   emit(FeaturedBookSuccess(books));
 },);
  }

}
