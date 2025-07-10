import 'package:bookly_app/Features/search/data/data_source/search_local_data_source.dart';
import 'package:bookly_app/Features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookly_app/Features/search/domain/use_case/search_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Features/home/data/data_source/home_local_data_source.dart';
import '../../../Features/home/data/data_source/home_remote_data_source.dart';
import '../../../Features/home/data/repos/home_repo_impl.dart';
import '../../../Features/search/data/repos/search_repo_impl.dart';
import '../api_service.dart';
final getIt = GetIt.instance;
void setUpServiceLocator() {
  // 🔧 ApiService
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // 🏠 HomeRepo
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );

  // 🌐 Search Remote Data Source
  getIt.registerSingleton<SearchRemoteDataSource>(
    SearchRemoteDataSourceImpl(getIt.get<ApiService>()),
  );

  // 💾 Search Local Data Source ✅ أضف ده
  getIt.registerSingleton<SearchLocalDataSource>(
    SearchLocalDataSourceImpl(),
  );

  // 🔍 SearchRepo
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      getIt.get<SearchRemoteDataSource>(),
      getIt.get<SearchLocalDataSource>(),
    ),
  );

  // 💼 Search UseCase
  getIt.registerSingleton<SearchUseCase>(
    SearchUseCase(getIt.get<SearchRepoImpl>()),
  );
}

