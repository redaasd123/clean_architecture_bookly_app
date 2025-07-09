import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_newest_Books_uses_case.dart';
import 'package:meta/meta.dart';
import '../../../domain/entity/book_entity.dart';
part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.fetchNewestBookUseCase) : super(NewestBookInitial());
  final fetchNewestBooksUseCase fetchNewestBookUseCase;

 Future<void> fetchNewestBook({int pageNumber = 0})async{
   print("📥 fetching page number: $pageNumber");
   if(pageNumber ==0) {
     emit(NewestBookLoading());
   }else{
     emit(NewestBookPaginationLoading());
   }
    var result = await fetchNewestBookUseCase.call(pageNumber);
   result.fold((failure){
     if(pageNumber==0) {
       emit(NewestBookFailure(failure.errMessage));
     }else{
       emit(NewestBookPaginationFailure(failure.errMessage));
     }
   }, (books) {
     emit(NewestBookSuccess(books));
   });
   }
}
