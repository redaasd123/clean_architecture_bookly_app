import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_book_list_view_loading_fading.dart';
import 'package:bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/funcation/custom_snack_bar.dart';
import '../../manager/featured_book_cubit/featured_book_cubit.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {


  const FeaturedBooksListViewBlocBuilder({super.key, });

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() => _FeaturedBooksListViewBlocBuilderState();
}
class _FeaturedBooksListViewBlocBuilderState extends State<FeaturedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit,FeaturedBookState>
      (builder: (context,state){
      if(state is FeaturedBookSuccess||
          state is FeaturedBookPaginationFailure
      ||state is FeaturedBookPaginationLoading){
        return FeaturedBooksListView(book:books,);
      }else if(state is FeaturedBookFailure){
        return Text(state.errMessage);
      }else{
        return const FeaturedBookListViewLoadingFading();
      }
    },
        listener: (context,state){
        if(state is FeaturedBookSuccess){
          books.addAll(state.books);
        }
        if(state is FeaturedBookPaginationFailure){
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar(
              message:'try later',
              backgroundColor: Colors.green,
            ),
          );
        }
        });


  }
}

