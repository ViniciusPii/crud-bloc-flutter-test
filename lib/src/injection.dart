import 'package:counter_bloc/src/modules/counter/counter_controller/counter_bloc.dart';
import 'package:counter_bloc/src/modules/crud/form_user/form_user_controller/form_user_bloc.dart';
import 'package:counter_bloc/src/modules/crud/list_user/list_user_controller/list_user_bloc.dart';
import 'package:counter_bloc/src/repositories/user/user_repository.dart';
import 'package:counter_bloc/src/repositories/user/user_repository_impl.dart';
import 'package:counter_bloc/src/services/user/user_service.dart';
import 'package:counter_bloc/src/services/user/user_service_impl.dart';
import 'package:get_it/get_it.dart';

injection() {
  final getIt = GetIt.I;

  //repositories
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  //services
  getIt.registerLazySingleton<UserService>(() => UserServiceImpl());

  //controllers
  getIt.registerFactory<CounterBloc>(() => CounterBloc());
  getIt.registerFactory<ListUserBloc>(() => ListUserBloc());
  getIt.registerFactory<FormUserBloc>(() => FormUserBloc());
}
