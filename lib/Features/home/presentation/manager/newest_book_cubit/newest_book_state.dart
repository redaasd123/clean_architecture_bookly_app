part of 'newest_book_cubit.dart';

@immutable
sealed class NewestBookState {}

final class NewestBookInitial extends NewestBookState {}
final class NewestBookLoading extends NewestBookState {}
final class NewestBookSuccess extends NewestBookState {
  final List<BookEntity> books;
  NewestBookSuccess(this.books);
}
final class NewestBookFailure extends NewestBookState {
  final String errMessage;
  NewestBookFailure(this.errMessage);
}