import 'package:book_app_clean_arch/core/utils/api_services.dart';
import 'package:book_app_clean_arch/features/home/data/dataSources/home_local_data_source.dart';
import 'package:book_app_clean_arch/features/home/data/dataSources/home_remote_data_source.dart';
import 'package:book_app_clean_arch/features/home/data/repositories/home_repository_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepositoryImp>(
    HomeRepositoryImp(
      HomeRemoteDataSourceImp(getIt.get<ApiServices>()),
      HomeLocalDataSourceImp(),
    ),
  );
}
