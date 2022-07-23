import 'package:counter_bloc/src/models/user_model.dart';
import 'package:counter_bloc/src/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final List<UserModel> _users = [];

  @override
  List<UserModel> getUsers() {
    return _users;
  }

  @override
  List<UserModel> removeUser(UserModel user) {
    _users.remove(user);
    return _users;
  }

  @override
  List<UserModel> addUser(UserModel user) {
    _users.add(user);
    return _users;
  }
}
