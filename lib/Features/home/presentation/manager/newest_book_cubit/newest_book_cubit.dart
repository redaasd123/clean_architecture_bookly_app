import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_newest_Books_uses_case.dart';
import 'package:meta/meta.dart';
import '../../../domain/entity/book_entity.dart';
part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.fetchNewestBookUseCase) : super(NewestBookInitial());
  final fetchNewestBooksUseCase fetchNewestBookUseCase;

 Future<void> fetchNewestBook()async{
   emit(NewestBookLoading());
    var result = await fetchNewestBookUseCase.call();
   result.fold((failure){
     emit(NewestBookFailure(failure.errMessage));
   }, (books){
     emit(NewestBookSuccess(books));
   });
 }


}
