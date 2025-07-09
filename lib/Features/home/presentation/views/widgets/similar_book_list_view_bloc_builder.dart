import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image_loading_fading.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similar_books_fading_list_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/similar_books/similar_books_cubit.dart';
import 'featured_book_list_view_loading_fading.dart';

class SimilarBooksListViewBlocBuilder extends
StatelessWidget {
  const SimilarBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(builder: (context,state){
      if(state is SimilarBooksSuccess){
        return SimilarBooksListview(bookEntity: state.book);
      }else if(state is SimilarBooksFailure){
        return Text(state.errMessage);
      }else{
        return SimilarBooksFadingListView();
      }
    });
  }
}
