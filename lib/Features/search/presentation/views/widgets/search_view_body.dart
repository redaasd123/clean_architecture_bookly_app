import 'package:bookly_app/Features/search/presentation/views/widgets/result_search_list_view_bloc_builder.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/suggestion_list_view_bloc_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
           SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchTextField(),
                SizedBox(height: 16),
                Text('Search Result', style: Styles.textStyle18),
                SizedBox(height: 16),
              ],
            ),
          ),
          // ✅ نتائج البحث
          ResultSearchListViewBlocBuilder()
        ],
      ),
    );
  }
}
