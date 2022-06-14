import 'package:counter_bloc/src/models/user_model.dart';

abstract class UserService {
  List<UserModel> getUsers();
  List<UserModel> addUser(UserModel user);
  List<UserModel> removeUser(UserModel user);
}
