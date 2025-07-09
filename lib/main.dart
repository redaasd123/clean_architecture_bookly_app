
import 'package:bookly_app/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/domain/entity/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_newest_Books_uses_case.dart';
import 'package:bookly_app/Features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observe.dart';
import 'core/utils/funcation/setup_serviece_locator.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());


  // await Hive.deleteBoxFromDisk(kFeaturedBooks);
  // await Hive.deleteBoxFromDisk(kNewestBooks);
  // await Hive.deleteBoxFromDisk(kSimilarBooks);

  // ✅ بعدين افتح الصناديق من جديد
  await Hive.openBox<BookEntity>(kFeaturedBooks);
  await Hive.openBox<BookEntity>(kNewestBooks);
  await Hive.openBox<BookEntity>(kSimilarBooks);

  // التهيئة والباقي
  setUpServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(BooklyApp());
}

// Future<void> clearAllHiveCache() async {
//   await Hive.box<BookEntity>(kFeaturedBooks).clear();
//   await Hive.box<BookEntity>(kNewestBooks).clear();
//   print('✅ تم مسح بيانات Hive المؤقتة بنجاح');
// }

class BooklyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeaturedBookCubit(
            fetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>(),
            )
          ,)..fetchFeaturedBooks()
          ,),

        BlocProvider(create: (context)=>NewestBookCubit(
            fetchNewestBooksUseCase(getIt.get<HomeRepoImpl>(),
            ),
        )..fetchNewestBook()
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}