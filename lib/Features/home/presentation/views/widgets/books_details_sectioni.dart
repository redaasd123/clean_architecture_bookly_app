import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';



class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              CustomBookImage(
                book: bookEntity,
                image: bookEntity.image ?? AssetsData.testImage,
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text(
          bookEntity.title,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            bookEntity.authorName ?? 'كاتب غير معروف',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(height: 18),
        BookRating(
          rate: bookEntity.rating ?? 0,
          count: bookEntity.count ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 20),
        BooksAction(
          webReaderLink: bookEntity.webReaderLink,
            preViewLink: bookEntity.previewLink),
        const SizedBox(height: 3),
      ],
    );
  }
}
