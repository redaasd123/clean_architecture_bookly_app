import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/featured_book_cubit/featured_book_cubit.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {


  const FeaturedBooksListViewBlocBuilder({super.key, });

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() => _FeaturedBooksListViewBlocBuilderState();
}
class _FeaturedBooksListViewBlocBuilderState extends State<FeaturedBooksListViewBlocBuilder> {
//  هنا كنت بعرض 10 كتب بس اللي جاية ف انا عملت ليست فاضية اخزن فيها كل الكتب وهي اللي اعرض منها
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit,FeaturedBookState>
      (builder: (context,state){
      if(state is FeaturedBookSuccess||
          state is FeaturedBookPaginationLoading
      ||state is FeaturedBookPaginationFailure){
        return FeaturedBooksListView(book:books,);
      }else if(state is FeaturedBookFailure){
        return Text(state.errMessage);
      }else{
        return CircularProgressIndicator();
      }
    },
        listener: (context,state){
        if(state is FeaturedBookSuccess){
          books.addAll(state.books);
        }
        if(state is FeaturedBookPaginationFailure){
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar(
              message: 'please wait,'
                        'try later',
              backgroundColor: Colors.green,
            ),
          );
        }
        });


  }
}

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    required String message,
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(seconds: 2),
  }) : super(
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: backgroundColor,
    duration: duration,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
}