import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/newest_book_list_view_loading_fading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_list_view.dart';

class BestSellerListViewBlocBuilder extends
StatefulWidget {
  const BestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  State<BestSellerListViewBlocBuilder> createState() => _BestSellerListViewBlocBuilderState();
}

class _BestSellerListViewBlocBuilderState extends State<BestSellerListViewBlocBuilder> {

  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBookCubit, NewestBookState>(
      listener: (context, state) {
        if (state is NewestBookSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewestBookSuccess||
        state is NewestBookPaginationLoading
        || state is NewestBookPaginationFailure) {
          return BestSellerListView(books: books);
        } else if (state is NewestBookFailure) {
          return Text(state.errMessage);
        } else {
          return NewestBookListViewLoadingFading();
        }
      },
    );

  }
}