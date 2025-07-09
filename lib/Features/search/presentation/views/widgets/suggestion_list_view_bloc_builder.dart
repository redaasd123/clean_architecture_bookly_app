import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/search_cubit/search_cubit.dart';


class SuggestionListViewBlocBuilder extends StatelessWidget {
  const SuggestionListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuggestionsState && state.suggestions.isNotEmpty) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: state.suggestions.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final suggestion = state.suggestions[index];
                return ListTile(
                  title: Text(suggestion,style: Styles.textStyle18,),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    BlocProvider.of<SearchCubit>(context)
                        .searchBooks(suggestion);
                  },
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

