import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image_loading_fading.dart';
import 'package:bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:flutter/cupertino.dart';
class FeaturedBookListViewLoadingFading extends StatelessWidget {
  const FeaturedBookListViewLoadingFading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        itemCount: 15,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomFadingWidget(
              delay: Duration(milliseconds: index * 100), // تأخير تدريجي
              child: const CustomBookImageLoadingFading(), // shimmer + fade
            ),
          );
        },
      ),
    );
  }
}

