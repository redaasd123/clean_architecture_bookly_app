part of 'featured_book_cubit.dart';

@immutable
sealed class FeaturedBookState {}

final class FeaturedBookInitial extends FeaturedBookState {}
final class FeaturedBookLoading extends FeaturedBookState {}
final class FeaturedBookPaginationLoading extends FeaturedBookState {}
final class FeaturedBookPaginationFailure extends FeaturedBookState {
  final String errMessage;

  FeaturedBookPaginationFailure({required this.errMessage});
}
final class FeaturedBookSuccess extends FeaturedBookState {
 final List<BookEntity> books;
  FeaturedBookSuccess(this.books);
}
final class FeaturedBookFailure extends FeaturedBookState {
  final String errMessage;
  FeaturedBookFailure(this.errMessage);
}