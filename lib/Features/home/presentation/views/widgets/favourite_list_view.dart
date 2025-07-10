import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../../constants.dart';
import '../../../domain/entity/book_entity.dart';
import 'best_seller_list_view_item.dart';

class FavouriteListView extends StatelessWidget {
  const FavouriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteBox = Hive.box<BookEntity>(kSaveFavorite);
    final favoriteBooks = favoriteBox.values.toList();
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favoriteBooks.length,
      itemBuilder: (context, index) {
        final book = favoriteBooks[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: BestSellerListViewItem(bookEntity: book),
        );
      },
    );
  }
}
