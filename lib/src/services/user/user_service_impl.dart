import 'package:counter_bloc/src/models/user_model.dart';
import 'package:counter_bloc/src/repositories/user/user_repository.dart';
import 'package:counter_bloc/src/services/user/user_service.dart';
import 'package:get_it/get_it.dart';

class UserServiceImpl implements UserService {
  final _userRepository = GetIt.I.get<UserRepository>();

  @override
  List<UserModel> getUsers() => _userRepository.getUsers();

  @override
  List<UserModel> addUser(UserModel user) => _userRepository.addUser(user);

  @override
  List<UserModel> removeUser(UserModel user) => _userRepository.removeUser(user);
}
