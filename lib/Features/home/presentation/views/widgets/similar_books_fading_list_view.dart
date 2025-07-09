import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image_loading_fading.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/widgets/custom_fading_widget.dart';
import 'custom_book_item.dart';

class SimilarBooksFadingListView extends StatelessWidget {
  const SimilarBooksFadingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          itemCount: 29,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomFadingWidget(
                delay: Duration(milliseconds: index * 100), // تأخير تدريج// shimmer + fade
              child: CustomBookImageLoadingFading(),
              ),);
          }),
    );
  }
}
