import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_list_view_item.dart';
class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}
class _BestSellerListViewState extends State<BestSellerListView> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  int nextPage = 1;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          0.7 * _scrollController.position.maxScrollExtent &&
          !isLoading) {
        isLoading = true;
        print("📦 Fetching page number: $nextPage");

        BlocProvider.of<NewestBookCubit>(context)
            .fetchNewestBook(pageNumber: nextPage++);

        Future.delayed(const Duration(seconds: 1), () {
          isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BestSellerListViewItem(bookEntity: widget.books[index]),
          );
        },
        childCount: widget.books.length,
      ),
    );
  }
}
