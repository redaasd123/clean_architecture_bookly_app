part of 'similar_books_cubit.dart';

@immutable
sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksLoading extends SimilarBooksState {}
final class SimilarBooksSuccess extends SimilarBooksState{
  final List<BookEntity> book;

  SimilarBooksSuccess({required this.book});
}
final class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;
  SimilarBooksFailure({required this.errMessage});
}


