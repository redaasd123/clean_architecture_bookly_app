

import 'package:bookly_app/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/my_app_drwer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: MyAppDrawer(),
      body: HomeViewBody(),
    );
  }
}
// icon: FontAwesomeIcons.magnifyingGlass,
//                   onPressed: (){
//                     GoRouter.of(context).push(AppRouter.kSearchView);
//
//                   },