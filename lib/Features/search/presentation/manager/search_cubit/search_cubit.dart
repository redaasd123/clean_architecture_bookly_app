import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/search/domain/use_case/search_use_case.dart';
import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitial());

  final SearchUseCase searchUseCase;

  Future<void> searchBooks(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoadingState());

    final result = await searchUseCase.call(query);
    result.fold(
          (failure) => emit(SearchFailureState(errMessage: failure.errMessage)),
          (books) async {
        final box = Hive.box<BookEntity>(kSearchBooks);
       // await box.clear();

        for (var book in books) {
          await box.add(book);
        }

        emit(SearchSuccessState(books: books));
      },
    );
  }

  void updateSuggestions(String input) {
    final box = Hive.box<BookEntity>(kSearchBooks);

    if (input.trim().isEmpty || box.isEmpty) {
      emit(SearchSuggestionsState(suggestions: []));
      return;
    }

    final matches = box.values
        .map((book) => book.title)
        .where((title) => title.toLowerCase().contains(input.toLowerCase()))
        .toSet()
        .toList();

    emit(SearchSuggestionsState(suggestions: matches));
  }
}
