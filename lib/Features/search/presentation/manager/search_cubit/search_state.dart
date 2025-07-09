part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<BookEntity> books;
  SearchSuccessState({required this.books});
}

class SearchFailureState extends SearchState {
  final String errMessage;
  SearchFailureState({required this.errMessage});
}

class SearchSuggestionsState extends SearchState {
  final List<String> suggestions;
  SearchSuggestionsState({required this.suggestions});
}
