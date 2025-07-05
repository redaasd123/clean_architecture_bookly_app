import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_book_state.dart';
class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.featuredBooksUseCase)
      : super(FeaturedBookInitial());
  final fetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void>fetchFeaturedBooks({int pageNumber =0})
 async {
    if(pageNumber==0){
      emit(FeaturedBookLoading());
    }else{
      emit(FeaturedBookPaginationLoading());
    }
 var result  = await featuredBooksUseCase.call(pageNumber);
 result.fold((failure){
   if(pageNumber==0){
     emit(FeaturedBookFailure(failure.errMessage));
   }else{
     emit(FeaturedBookPaginationFailure(errMessage: failure.errMessage));
   }

 }, (books){
   emit(FeaturedBookSuccess(books));
 },);
  }

}
