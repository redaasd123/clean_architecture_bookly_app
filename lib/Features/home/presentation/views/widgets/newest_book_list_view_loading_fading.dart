import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_best_seller_loading_fading.dart';
import 'package:bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'best_seller_list_view_item.dart';

class NewestBookListViewLoadingFading extends StatelessWidget {
  const NewestBookListViewLoadingFading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomFadingWidget(
              delay: Duration(milliseconds: index * 100),
              child: const CustomBookBestSellerLoadingFading(),
            ),
          );
        },
        childCount: 15,
      ),
    );
  }
}
