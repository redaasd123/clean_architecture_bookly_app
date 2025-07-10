import 'package:bookly_app/Features/home/presentation/views/widgets/favourite_view_body.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/my_app_drwer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      body: FavouriteViewBody(),
    );
  }
}
