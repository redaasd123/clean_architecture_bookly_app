import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/search/domain/use_case/search_use_case.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitial());

  final SearchUseCase searchUseCase;
  //إن الـCubit معتمد على UseCase من طبقة الـDomain.

  List<BookEntity> _cachedBooks = [];
//ده Getter (مش فانكشن):
// بيرجع كل العناوين اللي موجودة في _cachedBooks من غير تكرار.
// بنستخدمه في عرض اقتراحات للمستخدم.
  List<String> get suggestions => _cachedBooks
      .map((book) => book.title)
      .where((title) => title.isNotEmpty)
      .toSet()
      .toList();

  Future<void> searchBooks(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoadingState());

    final result = await searchUseCase.call(query);
    result.fold(
          (failure) => emit(SearchFailureState(errMessage: failure.errMessage)),
          (books) {
        //  اجمع كل الكتب بدل ما تمسح الأدي
        _cachedBooks.addAll(books);
        emit(SearchSuccessState(books: books));
      },
    );
  }

  void updateSuggestions(String input) {
    if (input.trim().isEmpty || _cachedBooks.isEmpty) {
      emit(SearchSuggestionsState(suggestions: []));
      return;
      //لو المستخدم مبكتبش حاجة، أو مفيش بيانات كاش → بلاش اقتراحات.
    }

    final matches = _cachedBooks
        .map((book) => book.title)
        .where((title) => title.toLowerCase().contains(input.toLowerCase()))
        .toSet()
        .toList();

    emit(SearchSuggestionsState(suggestions: matches));
    //🟡 لو فيه بيانات، بنفلتر العناوين اللي بتبدأ بنفس الحروف اللي المستخدم كتبها.
  }
}
