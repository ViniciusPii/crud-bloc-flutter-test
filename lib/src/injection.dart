import 'package:counter_bloc/src/repositories/user/user_repository.dart';
import 'package:counter_bloc/src/repositories/user/user_repository_impl.dart';
import 'package:counter_bloc/src/services/user/user_service.dart';
import 'package:counter_bloc/src/services/user/user_service_impl.dart';
import 'package:get_it/get_it.dart';

injection() {
  final getIt = GetIt.I;

  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerLazySingleton<UserService>(() => UserServiceImpl());
}
