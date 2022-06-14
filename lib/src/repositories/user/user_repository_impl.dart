import 'package:counter_bloc/src/models/user_model.dart';
import 'package:counter_bloc/src/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final List<UserModel> _users = [
    UserModel(name: 'Vinicius'),
    UserModel(name: 'Tais'),
    UserModel(name: 'Gu'),
    UserModel(name: 'Hugo'),
  ];

  @override
  List<UserModel> getUsers() {
    return _users;
  }
}
