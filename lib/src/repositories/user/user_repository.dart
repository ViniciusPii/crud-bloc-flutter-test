import 'package:counter_bloc/src/models/user_model.dart';

abstract class UserRepository {
  List<UserModel> getUsers();
}
