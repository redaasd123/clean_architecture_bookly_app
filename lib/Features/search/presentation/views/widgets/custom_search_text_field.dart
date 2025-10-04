import 'package:bookly_app/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/suggestion_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class CustomSearchTextField extends StatelessWidget {
   CustomSearchTextField({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          onChanged: (value) {
            final cubit = BlocProvider.of<SearchCubit>(context);
            cubit.updateSuggestions(value);

            // بحث فقط لو عدد الحروف >= 2
            if (value.length >= 2) {
              cubit.searchBooks(value);
            }
          },
          decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: 'Search',
            suffixIcon: IconButton(
              onPressed: () {
                final query = controller.text.trim();
                if (query.isNotEmpty && query.length >= 2) {
                  BlocProvider.of<SearchCubit>(context).searchBooks(query);
                  FocusScope.of(context).unfocus(); //
                }
              },
              icon: const Opacity(
                opacity: .8,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 22,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),

        // ✅ الاقتراحات التلقائية
        SuggestionListViewBlocBuilder(),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}

