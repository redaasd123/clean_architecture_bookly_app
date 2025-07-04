import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/core/widgets/custom_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/featured_book_cubit/featured_book_cubit.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {


  const FeaturedBooksListViewBlocBuilder({super.key, });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if(state is FeaturedBookSuccess){
          return FeaturedBooksListView(book:state.books,);
        }else if(state is FeaturedBookFailure){
        return Text(state.errMessage);
         }else{
          return CustomProgressIndicator();
        }

      },
    );
  }
}