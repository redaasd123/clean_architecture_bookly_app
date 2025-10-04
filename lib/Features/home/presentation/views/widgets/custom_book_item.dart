import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/funcation/show_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../domain/entity/book_entity.dart';

class CustomBookImage extends StatelessWidget {
  final String image;
  final BookEntity book;

  const CustomBookImage({required this.image, required this.book, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteBox = Hive.box<BookEntity>(kSaveFavorite);
    return Stack(
      children: [
      AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Hero(
        tag: book.bookId,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            image,
            height: 200,
            width: 130,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),

        Positioned(
          top: 8,
          right: 8,
          child: ValueListenableBuilder(
            valueListenable: favoriteBox.listenable(),
            builder: (context, Box<BookEntity> box, _) {
              final isFavorite = box.containsKey(book.bookId);
              return GestureDetector(
                onTap: () {
                  if (isFavorite) {
                    box.delete(book.bookId);
                    showSnackBar(message: 'تمت الازالة من المفضلة❤️', context: context);
                  } else {
                    box.put(book.bookId, book);
                    showSnackBar(message: 'تمت الاضافة في المفضلة❤️', context: context);

                  }
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 24,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
