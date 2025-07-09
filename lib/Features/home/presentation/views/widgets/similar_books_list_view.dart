import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/core/use_case/params/fetch_similar_books_params.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/funcation/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/similar_books/similar_books_cubit.dart';
import 'custom_book_item.dart';

class SimilarBooksListview extends StatefulWidget {
  const SimilarBooksListview({
    super.key,
    required this.bookEntity,
  });

  final List<BookEntity> bookEntity;

  @override
  State<SimilarBooksListview> createState() => _SimilarBooksListviewState();
}

class _SimilarBooksListviewState extends State<SimilarBooksListview> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  int nextPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7 &&
        !isLoading) {
      isLoading = true;

      await BlocProvider.of<SimilarBooksCubit>(context)
          .fetchSimilarBooks(FetchSimilarBooksParams(
          category: 'sport', pageNumber: nextPage++));


      // تأخير بسيط عشان نتأكد أن isLoading مبيترسترش بدري
      await Future.delayed(const Duration(milliseconds: 500));
      isLoading = false;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // مهم علشان ما يحصلش memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.bookEntity.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
                onTap: (){
                  launchPreviewLink(widget.bookEntity[index].previewLink);
                },
                child: CustomBookImage(image: widget.bookEntity[index].image ?? AssetsData.testImage)),
          );
        },
      ),
    );
  }
}
