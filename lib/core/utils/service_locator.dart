import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio()); // بنسجل Dio مرة واحدة للتطبيق كله
  
  // بنسجل الـ Repo Implementation
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(getIt.get<Dio>()),
  );
}