import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Features/home/data/data_source/home_local_data_source.dart';
import '../../../Features/home/data/data_source/home_remote_data_source.dart';
import '../../../Features/home/data/repos/home_repo_impl.dart';
import '../../../main.dart';
import '../api_service.dart';
final getIt = GetIt.instance;
void setUpServieceLocator() {

  getIt.registerSingleton(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
    homeLocalDataSource: HomeLocalDataSourceImpl(),
  ),);
}