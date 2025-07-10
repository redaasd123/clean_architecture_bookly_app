import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/cupertino.dart';

import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.bookEntity});

  final List<BookEntity> bookEntity;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BestSellerListViewItem(bookEntity: bookEntity[index]),
          );
        },
        childCount: bookEntity.length,
      ),
    );
  }
}
