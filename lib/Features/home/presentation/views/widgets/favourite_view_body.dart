import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/favourite_list_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../domain/entity/book_entity.dart';


class FavouriteViewBody extends StatefulWidget {
  const FavouriteViewBody({super.key});

  @override
  State<FavouriteViewBody> createState() => _FavouriteViewBodyState();
}

class _FavouriteViewBodyState extends State<FavouriteViewBody> {
  @override
  Widget build(BuildContext context) {
    final favoriteBox = Hive.box<BookEntity>(kSaveFavorite);

    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CustomAppBar(),
          ),

          Expanded(
            child: ValueListenableBuilder(
              valueListenable: favoriteBox.listenable(), // ✅ هنا السحر بيحصل
              builder: (context, Box<BookEntity> box, _) {
                final favoriteBooks = box.values.toList();
                if (favoriteBooks.isEmpty) {
                  return Center(
                    child: Text(
                      'لا توجد كتب مفضلة حتى الآن ❤️',
                      style: Styles.textStyle20,
                    ),
                  );
                } else {
                  return FavouriteListView();
                }
              },
            ),
          ),
        ],

    );
  }

}
