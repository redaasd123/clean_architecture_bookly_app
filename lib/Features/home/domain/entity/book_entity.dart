import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;

  @HiveField(1)
  final String? image;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String? authorName;

  @HiveField(4)
  final num? rating;

  @HiveField(5)
  final num? price;

  @HiveField(6)
  final num? count;

  @HiveField(7)
  final String category;

  @HiveField(8)
  final String previewLink;

  @HiveField(9)
  final String webReaderLink;

  BookEntity({
    required this.webReaderLink,
    required this.bookId,
    required this.title,
    required this.authorName,
    required this.image,
    required this.count,
    required this.price,
    required this.rating,
    required this.category,
    required this.previewLink,
  });
}
