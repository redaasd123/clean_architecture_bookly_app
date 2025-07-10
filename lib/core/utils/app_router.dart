import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_cases/similar_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/favourite_view.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/Features/search/domain/use_case/search_use_case.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/core/utils/funcation/setup_serviece_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/splash_view.dart';
import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kFavouriteView = '/favourite';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchUseCase>()),
          child: SearchView(),
        ),
      ),

      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) =>
            BlocProvider(
              create: (context) =>
                  SimilarBooksCubit(
                      FetchSimilarBooksUseCase(getIt.get<HomeRepoImpl>())),
              child: BookDetailsView(
                bookEntity: state.extra as BookEntity,
              ),
            ),
      ),

      GoRoute(
        path: kFavouriteView,
        builder: (context, state) => const FavouriteView(),
      ),
    ],
  );
}
