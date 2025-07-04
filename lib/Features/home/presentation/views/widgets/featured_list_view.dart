import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  final List<BookEntity> book;
  const FeaturedBooksListView({Key? key, required this.book, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        itemCount: book.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImage
                (image: book[index].image??'',),
            );
          }),
    );
  }
}
