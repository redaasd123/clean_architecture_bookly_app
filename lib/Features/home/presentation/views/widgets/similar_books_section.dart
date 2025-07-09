
import 'package:bookly_app/Features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similar_book_list_view_bloc_builder.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
         SimilarBooksListViewBlocBuilder(),
      ],
    );
  }
}

