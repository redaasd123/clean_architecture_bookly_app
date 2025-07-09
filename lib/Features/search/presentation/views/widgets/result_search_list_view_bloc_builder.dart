
import 'package:bookly_app/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/search_cubit/search_cubit.dart';

class  ResultSearchListViewBlocBuilder extends StatelessWidget {
  const  ResultSearchListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return SearchResultListView(bookEntity : state.books);
        } else if (state is SearchFailureState) {
          return SliverToBoxAdapter(
            child: Text(state.errMessage),
          );
        } else if (state is SearchLoadingState) {
          return const SliverToBoxAdapter(
            child: Center(
              child: const CircularProgressIndicator(),
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
